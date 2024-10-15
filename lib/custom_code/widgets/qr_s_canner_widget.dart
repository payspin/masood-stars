// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class QrSCannerWidget extends StatefulWidget {
  const QrSCannerWidget({
    super.key,
    this.width,
    this.height,
    required this.onValueChanged,
  });

  final double? width;
  final double? height;
  final Future Function(String selectedValue)? onValueChanged;

  @override
  State<QrSCannerWidget> createState() => _QrSCannerWidgetState();
}

class _QrSCannerWidgetState extends State<QrSCannerWidget> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;

  @override
  void initState() {
    super.initState();
    // Start scanning automatically when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScanner();
    });
  }

  // Start the scanner and return the result through the onValueChanged callback
  void _startScanner() {
    _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
      context: context,
      onCode: (scannedCode) {
        setState(() {
          code = scannedCode;
        });

        // Only pass the result to onValueChanged, do not display it
        if (scannedCode != null && widget.onValueChanged != null) {
          widget.onValueChanged!(scannedCode); // Return the result
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (code != null)
            ElevatedButton(
              onPressed: () {
                // Start a new scan when the button is pressed
                _startScanner();
                print("Scan Again button tapped");
              },
              child: Text('Scan Again'),
            ),
        ],
      ),
    );
  }
}
