// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> getDeviceTokenAction(BuildContext context) async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? deviceToken = await messaging.getToken();

  // Store the token in an App State variable
  if (deviceToken != null) {
    FFAppState().deviceToken =
        deviceToken; // Make sure FFAppState().deviceToken is defined as an App State variable
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
