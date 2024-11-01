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

Future<void> initializeFCM(BuildContext context) async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    handleNotification(context, message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    handleNotification(context, message);
  });
}

void handleNotification(BuildContext context, RemoteMessage message) {
  // Navigate based on the notification data
  if (message.data['screen'] == 'bookingsClient') {
    String bookingRef = message.data['bookingRef'];

    // Use the route for the `viewDetailsAccepted` page and pass the booking reference
    Navigator.pushNamed(
      context,
      '/bookingsClient', // Ensure this matches the route name in FlutterFlow
      arguments: bookingRef,
    );
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
