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
    this.email,
    this.userName,
    this.employeeNumber,
    this.colorCode,
  });

  final double? width;
  final double? height;
  final String? email;
  final String? userName;
  final String? employeeNumber;
  final String? colorCode;

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Delay the capture to ensure full rendering
      Future.delayed(
          const Duration(milliseconds: 5000),
          () => _captureAndUploadImage(
                widget.email!,
                widget.userName!,
                widget.employeeNumber!,
                widget.colorCode!,
              ));
    });
  }

  Future<String?> _captureAndUploadImage(String email, String userName,
      String employeeNumber, String colorCode) async {
    try {
      print(email);

      // Query Firestore for the user document with the matching email
      QuerySnapshot userQuery = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1) // Limit to 1 as email should be unique
          .get();

      if (userQuery.docs.isNotEmpty) {
        DocumentSnapshot userDoc = userQuery.docs.first;
        var userData = userDoc.data() as Map<String, dynamic>;

        if (userData['receivedEmail'] == true) {
          // If receivedEmail is true, return without proceeding further
          print('Email already sent to this user.');
          return null;
        }

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
            'senderName': 'Masaood stars Event',
            'subject': 'Welcome to Masaood Stars Event',
            'message':
                'Thank you for signing up to attend our upcoming Masaood Stars Awards Ceremony & Union Day Celebrations,\n The event is taking place on Sunday 10 November 2024 starting 3pm,\n This event is for employees of Al Masaood only,\n no family or friends will be admitted, Please show your QR code at the door for entry.',
            'email': widget.email ?? "noreply@masaoodstarsevent.com",
            'imageUrl': downloadUrl,
            'userName': userName,
            'employeeNumber': employeeNumber,
            'colorCode': colorCode,
          }),
        );

        if (response.statusCode == 200) {
          print('Email sent successfully');

          // Update Firestore: set receivedEmail to true after sending the email
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userDoc.id) // Use the document ID from the query
              .update({'receivedEmail': true});
        } else {
          print('Failed to send email: ${response.body}');
        }

        return downloadUrl;
      } else {
        print('User with this email not found.');
        return null;
      }
    } catch (e) {
      print('Error capturing and uploading image: $e');
      return null;
    }
  }
}
