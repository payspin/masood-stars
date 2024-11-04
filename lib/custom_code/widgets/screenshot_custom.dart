// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data'; // Import this for ByteData
import 'dart:ui' as ui;

import 'package:barcode_widget/barcode_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class ScreenshotCustom extends StatefulWidget {
  const ScreenshotCustom({
    super.key,
    this.width,
    this.height,
    this.email,
    this.userName,
    this.employeeNumber,
  });

  final double? width;
  final double? height;
  final String? email;
  final String? userName;
  final String? employeeNumber;

  @override
  State<ScreenshotCustom> createState() => _ScreenshotCustomState();
}

class _ScreenshotCustomState extends State<ScreenshotCustom> {
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _repaintBoundaryKey,
      child: BarcodeWidget(
        data: widget.email ?? "Test",
        barcode: Barcode.qrCode(),
        width: widget.width ?? 100,
        height: widget.height ?? 30,
        color: const Color(0xFF101213),
        backgroundColor: Colors.transparent,
        errorBuilder: (_context, _error) => const SizedBox(
          width: 100,
          height: 30,
        ),
        drawText: false,
      ),
    );
  }

  Future<String?> _captureAndUploadImage(
      String email, String userName, String employeeNumber) async {
    try {
      print(email);

      // Continue to capture and upload image
      RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Upload to Firebase Storage
      String fileName =
          'screenshots/${DateTime.now().millisecondsSinceEpoch}.png';
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageRef.putData(pngBytes);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Send email with the uploaded image URL
      var response = await http.post(
        Uri.parse(
            'https://us-central1-oozf-aaff4.cloudfunctions.net/sendEmails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'senderName': 'Masaood Stars Awards',
          'subject': 'Welcome to Masaood Stars Awards',
          'message':
              'Thank you for signing up to attend our upcoming Masaood Stars Ceremony & Union Day Celebration. The event is taking place on Sunday 10 November 2024 at ADNIC, Hall 11. Use Parking B. Doors open at 2:15pm and the show starts at 3:00pm sharp until 8:00pm. Food will be served at 5:00pm. This event is for Al Masaood Employees ONLY. Family & friends are will not be permitted. Please show your QR code at the door.',
          'email': email,
          'imageUrl': downloadUrl,
          'userName': userName,
          'employeeNumber': employeeNumber
        }),
      );

      if (response.statusCode == 200) {
        print('Email sent successfully');
      } else {
        print('Failed to send email: ${response.body}');
      }

      return downloadUrl;
    } catch (e) {
      print('Error capturing and uploading image: $e');
      return null;
    }
  }
}
