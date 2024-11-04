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

import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:screenshot/screenshot.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html; // For web
import 'dart:io' as io; // For mobile platforms
import 'package:path_provider/path_provider.dart'; // For mobile platforms

class QrcodeScreenshotDL extends StatefulWidget {
  final String employeeName;
  final String qrCodeUrl;
  final double? width; // Optional width parameter
  final double? height; // Optional height parameter

  QrcodeScreenshotDL({
    Key? key,
    required this.employeeName,
    required this.qrCodeUrl,
    this.width, // Optional width
    this.height, // Optional height
  }) : super(key: key);

  @override
  _QrcodeScreenshotDLState createState() => _QrcodeScreenshotDLState();
}

class _QrcodeScreenshotDLState extends State<QrcodeScreenshotDL> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: widget.width ??
                  MediaQuery.sizeOf(context)
                      .width, // Use provided width or default
              height:
                  widget.height ?? 500, // Use provided height or default to 500
              decoration: const BoxDecoration(
                color: Colors.white, // Background color set to white
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Employee Name (bold)
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        widget.employeeName, // Employee name from the widget
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF101213),
                              fontSize: 24,
                              fontWeight: FontWeight.bold, // Set to bold
                            ),
                      ),
                    ),
                  ),
                  // QR Code Description
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2, 16, 2, 0),
                    child: Text(
                      'Show a copy of this QR code to be permitted. No QR code, no entry.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFF57636C),
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  // QR Code Image
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.qrCodeUrl, // QR code from the widget
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Event Logo
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Stars_Awards_2023_Logo-Main.png', // Event logo asset
                      width: 106,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // The Save QR Code Button
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 12, 12),
                      child: ElevatedButton(
                        onPressed:
                            captureAndDownloadFromWidget, // Call the screenshot function
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black, // Button color set to black
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(50), // Rounded edges
                          ),
                          elevation: 4,
                          minimumSize: Size(widget.width ?? double.infinity,
                              45), // Customizable button size
                        ),
                        child: const Text(
                          'Save your QR Code',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // New captureAndDownloadFromWidget function
  void captureAndDownloadFromWidget() async {
    // Capture the widget as an image and handle the download
    final imageBytes = await screenshotController.capture();

    if (imageBytes != null) {
      await downloadImage(imageBytes);
    }
  }

  // Download function for web and mobile platforms
  Future<void> downloadImage(Uint8List imageBytes) async {
    final fileName = "QRCode_${DateTime.now().millisecondsSinceEpoch}.png";

    if (kIsWeb) {
      // Web download
      final blob = html.Blob([imageBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // Mobile platforms download (Android/iOS)
      io.Directory? appDir;

      if (io.Platform.isAndroid) {
        appDir = await getExternalStorageDirectory();
      } else if (io.Platform.isIOS) {
        appDir = await getApplicationDocumentsDirectory();
      }

      if (appDir != null) {
        final path = '${appDir.path}/$fileName';
        final file = io.File(path);
        await file.writeAsBytes(imageBytes);
      }
    }
  }
}
