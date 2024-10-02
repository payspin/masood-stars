// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/actions/actions.dart' as action_blocks;

import 'package:another_flushbar/flushbar.dart';

Future showErrorMessage(
  BuildContext context,
  String? message,
) async {
  // Add your function code here!
  await Flushbar(
    messageText: Padding(
      padding: EdgeInsets.all(2), // Set padding of 10 on all sides
      child: SizedBox(
        width: 120, // Set the width to 120
        child: Text(
          message ?? '', // Your message here
          textAlign: TextAlign.center, // Center align the text
          style: TextStyle(
            color:
                Colors.white, // Set text color to white or your preferred color
          ),
        ),
      ),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.black,
    borderRadius: BorderRadius.circular(10),
  ).show(context);
}
