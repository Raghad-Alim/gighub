// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

// Define the custom login function
Future<String> customLogin(String email, String password) async {
  // Check if email and password are not empty
  if (email.isEmpty || password.isEmpty) {
    return "Email and password must not be empty."; // Return error if empty
  }

  try {
    // Attempt to sign in with email and password
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return "success"; // Return success if login is successful
  } on FirebaseAuthException catch (e) {
    // Handle specific Firebase Auth exceptions
    if (e.code == 'user-not-found') {
      return "No user found for that email."; // User not found
    } else if (e.code == 'wrong-password') {
      return "Wrong password provided."; // Incorrect password
    }
    return "An error occurred: ${e.message}"; // General error message
  } catch (e) {
    // Handle any other exceptions
    return "An unexpected error occurred: ${e.toString()}"; // Return unexpected error
  }
}
