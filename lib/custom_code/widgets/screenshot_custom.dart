// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:typed_data'; // Import this for ByteData
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ScreenshotCustom extends StatefulWidget {
  const ScreenshotCustom({
    super.key,
    this.width,
    this.height,
    this.qrCode,
    this.email,
  });

  final double? width;
  final double? height;
  final String? qrCode;
  final String? email;

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
        data: widget.qrCode ?? "Test",
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Delay the capture to ensure full rendering
      Future.delayed(
          const Duration(milliseconds: 5000), () => _captureAndUploadImage2());
    });
  }

  Future<String?> _captureAndUploadImage() async {
    try {
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

      return downloadUrl;
    } catch (e) {
      print('Error capturing and uploading image: $e');
      return null;
    }
  }

  Future<String?> _captureAndUploadImage2() async {
    try {
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

      // Post the API request
      var response = await http.post(
        Uri.parse(
            'https://us-central1-oozf-aaff4.cloudfunctions.net/sendEmails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'senderName': 'Al Masaood stars Event',
          'subject': 'Welcome to Al Masaood Stars Event',
          'message':
              'This email from Al Masaood Stars Event, scan the qr to join the event',
          'email': widget.email ?? "noreply@masaoodstarsevent.com",
          'imageUrl': downloadUrl,
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
