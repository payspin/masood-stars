// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'dart:html' as html; // For web

// For mobile platforms (Android/iOS), import path_provider
import 'package:path_provider/path_provider.dart'; // Only used for mobile platforms
import 'dart:io' as io; // Only used for mobile platforms (Android/iOS)

Future<List<dynamic>> downloadQrCode(String qrCodeUrl) async {
  // Generate a file name with a timestamp
  final fileName = "QRCode_${DateTime.now().millisecondsSinceEpoch}.png";

  // Fetch the QR code image from the URL
  final response = await http.get(Uri.parse(qrCodeUrl));

  if (response.statusCode != 200) {
    throw Exception("Failed to download QR code image.");
  }

  // The image data (bytes) from the response
  final imageBytes = response.bodyBytes;

  // For Web platform
  if (kIsWeb) {
    // Create a Blob from the image bytes and trigger a download via the browser
    final blob = html.Blob([imageBytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", fileName)
      ..click();
    html.Url.revokeObjectUrl(url);
    return [
      {'fileName': fileName},
      {'filePath': fileName}
    ];
  }

  // For Mobile platforms (Android/iOS)
  if (!kIsWeb) {
    // Ensure we're only running this code for Android/iOS
    io.Directory? appDir;

    // Platform-specific directory management for Android/iOS
    if (io.Platform.isAndroid) {
      appDir = await getExternalStorageDirectory();
    } else if (io.Platform.isIOS) {
      appDir = await getApplicationDocumentsDirectory();
    } else {
      throw Exception("Unsupported platform.");
    }

    if (appDir == null) {
      throw Exception("Failed to get storage directory.");
    }

    // Define the full path to save the QR code image
    final path = '${appDir.path}/$fileName';

    // Create a new file and write the image bytes to it
    final file = io.File(path);
    await file.writeAsBytes(imageBytes);

    return [
      {'fileName': fileName},
      {'filePath': path}
    ];
  }

  throw Exception("Platform not supported.");
}
