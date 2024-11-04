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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'package:qrcode_reader_web/qrcode_reader_web.dart'; // Ensure this import is correct and the package is installed.

class QrCodeScan2 extends StatefulWidget {
  const QrCodeScan2({
    Key? key,
    this.width,
    this.height,
    required this.onValueChanged,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future Function(String selectedValue)? onValueChanged;

  @override
  State<QrCodeScan2> createState() => _QrCodeScan2State();
}

class _QrCodeScan2State extends State<QrCodeScan2> {
  String? code;
  QrCodeReaderWeb? _qrCodeReader;

  @override
  void initState() {
    super.initState();
    // Initialize the scanner instance
    _qrCodeReader = QrCodeReaderWeb();

    // Start scanning automatically when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScanner();
    });
  }

  // Start the scanner and return the result through the onValueChanged callback
  void _startScanner() async {
    if (_qrCodeReader != null) {
      try {
        final scannedCode = await _qrCodeReader!.scanCode();

        setState(() {
          code = scannedCode;
        });

        // Only pass the result to onValueChanged, do not display it
        if (scannedCode != null && widget.onValueChanged != null) {
          widget.onValueChanged!(scannedCode); // Return the result
        }
      } catch (e) {
        // Handle exceptions (e.g., when scanning is canceled)
        print('Error during scanning: $e');
      }
    } else {
      print('QrCodeReaderWeb instance not initialized.');
    }
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
