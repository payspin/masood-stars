// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
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
    this.qrCode,
    this.email,
    this.userId,
  });

  final double? width;
  final double? height;
  final String? qrCode;
  final String? email;
  final String? userId;

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
      Future.delayed(const Duration(milliseconds: 5000),
          () => _captureAndUploadImage(widget.userId!));
    });
  }

  Future<String?> _captureAndUploadImage(String userId) async {
    try {
      // Check if receivedEmail is true in Firestore before proceeding
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists && userSnapshot.data() != null) {
        var userData = userSnapshot.data() as Map<String, dynamic>;
        if (userData['receivedEmail'] == true) {
          // If receivedEmail is true, return without proceeding further
          print('Email already sent to this user.');
          return null;
        }
      }

      // If receivedEmail is false or field not found, continue to send email
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

        // Update Firestore: set receivedEmail to true after sending the email
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({'receivedEmail': true});
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
