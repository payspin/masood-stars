// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qrcode_reader_web/qrcode_reader_web.dart';

class QrCodeScannerWeb extends StatefulWidget {
  const QrCodeScannerWeb({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<QrCodeScannerWeb> createState() => _QrCodeScannerWebState();
}

class _QrCodeScannerWebState extends State<QrCodeScannerWeb> {
  final List<String> qrCodeList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QRCodeReaderSquareWidget(
          onDetect: (QRCodeCapture capture) =>
              setState(() => qrCodeList.add(capture.raw)),
          size: widget.width ?? 250, // Use the passed width or default to 250
        ),
        QRCodeReaderTransparentWidget(
          onDetect: (QRCodeCapture capture) =>
              setState(() => qrCodeList.add(capture.raw)),
          targetSize:
              widget.height ?? 250, // Use the passed height or default to 250
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: qrCodeList.map((qrData) {
                return ListTile(
                  title: Text(qrData),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
