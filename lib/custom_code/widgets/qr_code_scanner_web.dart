// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qrcode_reader_web/qrcode_reader_web.dart'; // Import the qrcode_reader_web package

class QrCodeScannerWeb extends StatefulWidget {
  const QrCodeScannerWeb({
    super.key,
    this.width,
    this.height,
    required this.onQrCodeScanned,
  });

  final double? width;
  final double? height;
  final Future Function(String scannedText) onQrCodeScanned;

  @override
  State<QrCodeScannerWeb> createState() => _QrCodeScannerWebState();
}

class _QrCodeScannerWebState extends State<QrCodeScannerWeb> {
  final List<QRCodeCapture> _scannedList = []; // List to hold scanned captures

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      child: Column(
        children: [
          // Square QR code reader widget
          QRCodeReaderSquareWidget(
            onDetect: (QRCodeCapture capture) async {
              if (capture.raw.isNotEmpty) {
                await widget
                    .onQrCodeScanned(capture.raw); // Return the scanned QR code
                setState(() {
                  _scannedList.add(capture); // Add scanned capture to list
                });
              }
            },
            size: 250, // Set the size of the square scanner
          ),

          // Optional transparent widget that allows scanning without overlay
          QRCodeReaderTransparentWidget(
            onDetect: (QRCodeCapture capture) async {
              if (capture.raw.isNotEmpty) {
                await widget
                    .onQrCodeScanned(capture.raw); // Return the scanned QR code
                setState(() {
                  _scannedList.add(capture); // Add scanned capture to list
                });
              }
            },
            targetSize:
                250, // Set the size of the target area for the transparent widget
          ),

          // Display list of scanned QR codes
          Expanded(
            child: ListView.builder(
              itemCount: _scannedList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_scannedList[index]
                      .raw), // Show the raw data from the QR code
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
