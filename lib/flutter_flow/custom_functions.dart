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
