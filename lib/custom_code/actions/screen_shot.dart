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


Future<void> screenShot(BuildContext context, GlobalKey scaffoldKey) async {
  try {
    RenderRepaintBoundary boundary = scaffoldKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Upload to Firebase Storage
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('screenshots/${DateTime.now().millisecondsSinceEpoch}.png');
    UploadTask uploadTask = ref.putData(pngBytes);

    await uploadTask.whenComplete(() => print('Screenshot uploaded successfully'));
  } catch (e) {
    print('Error taking screenshot: $e');
  }
}