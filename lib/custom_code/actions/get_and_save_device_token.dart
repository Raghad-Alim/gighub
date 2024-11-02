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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> getAndSaveDeviceToken() async {
  // Get the current user ID
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) {
    print("User is not logged in.");
    return;
  }

  // Get the device token using Firebase Messaging
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? deviceToken = await messaging.getToken();

  if (deviceToken != null) {
    // Reference to the user document in Firestore
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('user').doc(userId);

    // Save or update the device token in the Firestore document
    await userDoc.set({
      'deviceToken': deviceToken,
    }, SetOptions(merge: true));

    print("Device token saved successfully: $deviceToken");
  } else {
    print("Failed to retrieve device token.");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
