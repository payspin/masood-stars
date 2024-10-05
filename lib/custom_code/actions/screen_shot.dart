// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:firebase_storage/firebase_storage.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future screenShot() async {
  // Take screen shoot for the entire screen and make it as image and save the imge to firebase storage then get the image uploaded irl and use it with api Send Email

  // Take screenshot of the entire screen
  RenderRepaintBoundary boundary =
      scaffoldKey.currentContext.findRenderObject();
  ui.Image image = await boundary.toImage();
  ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData.buffer.asUint8List();

  // Save the image to Firebase storage
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference ref =
      FirebaseStorage.instance.ref().child('screenshots/$fileName.png');
  UploadTask uploadTask = ref.putData(pngBytes);

  // Get the image URL after uploading
  String imageUrl = await (await uploadTask).ref.getDownloadURL();

  // Use the image URL with API to send email
  // Example API call to send email with image attachment
  // await sendEmailWithImage(imageUrl);

  print('Image uploaded to Firebase storage and URL: $imageUrl');
}
