import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int? notArrived(
  int? totalArrived,
  int? totalRegistered,
) {
  // Check for null values to ensure safe operations.
  if (totalArrived == null || totalRegistered == null) {
    return null;
  }

  // Calculate remaining registered by subtracting totalArrived from totalRegistered.
  return totalRegistered - totalArrived;
}

String? lowercaseword(String? lowercasepara) {
  // Check if the input is null, and if so, return null
  if (lowercasepara == null) {
    return null;
  }

  // Convert the input string to lowercase and assign it to a variable
  String lowercaseResult = lowercasepara.toLowerCase();

  // Return the variable holding the result
  return lowercaseResult;
}

String? takeText(String? textToCorrect) {
  String extractEmailAddress(String inputText) {
    // Check if the inputText contains the prefix
    if (inputText.startsWith("Code scanned = ")) {
      // Remove the prefix and return the remaining text
      return inputText.replaceFirst("Code scanned = ", "");
    }
    // Return the original input if the prefix is not found
    return inputText;
  }

  // Ensure textToCorrect is not null before processing
  if (textToCorrect != null) {
    return extractEmailAddress(textToCorrect);
  }
  return null; // Return null if input is null
}
