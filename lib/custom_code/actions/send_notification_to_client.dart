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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> sendNotificationToClient(String clientId) async {
  // Initialize the FlutterLocalNotificationsPlugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Retrieve client data from Firestore to get their device token
  DocumentSnapshot clientSnapshot =
      await FirebaseFirestore.instance.collection('user').doc(clientId).get();

  if (clientSnapshot.exists && clientSnapshot.data() != null) {
    var clientData = clientSnapshot.data() as Map<String, dynamic>;
    if (clientData.containsKey('deviceToken')) {
      String clientDeviceToken = clientData['deviceToken'];

      // Prepare Android-specific notification details
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'high_importance_channel', // Channel ID
        'High Importance Notifications', // Channel Name
        channelDescription: 'Channel for important notifications',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      // Send the notification
      await flutterLocalNotificationsPlugin.show(
        0, // Notification ID
        "Booking Accepted", // Notification Title
        "Your booking has been accepted!", // Notification Body
        platformChannelSpecifics,
        payload:
            clientDeviceToken, // Optional: Can be used for navigation purposes
      );
    } else {
      print("Client device token not found.");
    }
  } else {
    print("Client document not found in Firestore.");
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
