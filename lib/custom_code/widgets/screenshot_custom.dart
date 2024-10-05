// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:barcode_widget/barcode_widget.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:barcode_widget/barcode_widget.dart';

class ScreenshotCustom extends StatefulWidget {
  const ScreenshotCustom({
    super.key,
    this.width,
    this.height,
    this.qrCode,
  });

  final double? width;
  final double? height;
  final String? qrCode;

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
        color: Color(0xFF101213),
        backgroundColor: Colors.transparent,
        errorBuilder: (_context, _error) => SizedBox(
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
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _captureAndUploadImage());
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
}
