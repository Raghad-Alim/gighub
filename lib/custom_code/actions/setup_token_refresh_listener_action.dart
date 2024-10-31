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

Future<void> setupTokenRefreshListenerAction(BuildContext context) async {
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
    FFAppState().deviceToken = newToken; // Update App State with the new token

    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('user').doc(userId).set({
      'deviceToken': newToken,
    }, SetOptions(merge: true));
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
