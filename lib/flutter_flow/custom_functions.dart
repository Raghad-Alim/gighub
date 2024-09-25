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

List<String> gethour() {
  List<String> hourList = [];
  for (int hour = 0; hour < 24; hour++) {
    String formattedHour = hour.toString().padLeft(2, '0');
    String amPm = hour < 12 ? 'AM' : 'PM';
    int displayHour = hour == 0
        ? 12
        : hour <= 12
            ? hour
            : hour - 12;
    String hourString = '$displayHour:00 $amPm';
    hourList.add(hourString);
  }
  return hourList;
}

List<String> gethourafter(
  String selectedStart,
  List<String> allHours,
) {
  if (selectedStart == null || allHours == null) {
    return ["null"];
  }

  int inputIndex = allHours.indexOf(selectedStart);

  if (inputIndex == -1 || inputIndex == allHours.length - 1) {
    return allHours;
  }

  return allHours.sublist(inputIndex + 1);
}
