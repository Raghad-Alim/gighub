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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateTime>? newCustomFunction(
  DateTime? startDate,
  int? minutes,
  int? seconds,
  int? hours,
  int? days,
) {
// Create a list to hold the future dates
  List<DateTime> datesList = [];

  // Initialize currentDate with startDate or the current date
  DateTime currentDate = startDate ?? DateTime.now();

  // Loop to generate dates for the next 7 days
  for (int i = 0; i < 7; i++) {
    datesList.add(currentDate.add(Duration(
      minutes: minutes ?? 0,
      seconds: seconds ?? 0,
      hours: hours ?? 0,
      days: i, // Increment by the loop counter 'i' to generate the next days
    )));
  }

  // Return the list of future dates
  return datesList;
}

DateTime? getCurrentDate() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

List<DateTime>? getAvailableSlots(
  List<DateTime> bookings,
  DateTime dateArg,
  List<AvailabilityStruct> availability,
) {
/*
  final matchingAvailability = availability
      .where((a) =>
          a?.dayofWeek.toLowerCase() ==
          DateFormat('EEEE').format(dateArg).toLowerCase())
      .toList();

// Next, we need to create a list of DateTime objects representing the half-hourly blocks between the start and end times of each matching DayOfWeekWithTimeStruct object.
  final availableSlots = <DateTime>[];
  for (final a in matchingAvailability) {
    if (a.hasStartTime() && a.hasEndTime()) {
      final startHour = a.startTime!.hour;
      final endHour = a.endTime!.hour;
      final startMinute = a.startTime!.minute;
      final endMinute = a.endTime!.minute;

      for (var hour = startHour; hour <= endHour; hour++) {
        for (var minute = 0; minute < 60; minute += 30) {
          if (hour == startHour && minute < startMinute) {
            continue; // Skip this half-hour block before the start time.
          }

          if (hour == endHour && minute >= endMinute) {
            break; // Exit the minute loop when reaching or exceeding the end time.
          }

          availableSlots.add(
              DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute));
        }
      }
    }
  }
  // Finally, we need to filter out any DateTime objects that match the bookings list.
  final availableSlotsFiltered = availableSlots
      .where((slot) => !bookings.any((booking) =>
          booking.hour == slot.hour &&
          booking.minute == slot.minute &&
          booking.day == slot.day &&
          booking.month == slot.month &&
          booking.year == slot.year))
      .toList();

  DateTime now = DateTime.now();

  return availableSlotsFiltered.where((slot) => slot.isAfter(now)).toList();
*/

  final matchingAvailability = availability
      .where((a) =>
          a?.dayofWeek.toLowerCase() ==
          DateFormat('EEEE').format(dateArg).toLowerCase())
      .toList();

  // Create a list of DateTime objects representing the hourly blocks between the start and end times of each matching AvailabilityStruct object.
  final availableSlots = <DateTime>[];
  for (final a in matchingAvailability) {
    if (a.hasStartTime() && a.hasEndTime()) {
      final startHour = a.startTime!.hour;
      final endHour = a.endTime!.hour;

      // Loop through each hour between startHour and endHour and add the slots
      for (var hour = startHour; hour < endHour; hour++) {
        availableSlots
            .add(DateTime(dateArg.year, dateArg.month, dateArg.day, hour));
      }
    }
  }

  // Filter out any DateTime objects that match the bookings list.
  final availableSlotsFiltered = availableSlots
      .where((slot) => !bookings.any((booking) =>
          booking.hour == slot.hour &&
          booking.day == slot.day &&
          booking.month == slot.month &&
          booking.year == slot.year))
      .toList();

  DateTime now = DateTime.now();

  return availableSlotsFiltered.where((slot) => slot.isAfter(now)).toList();
}

List<AvailabilityStruct>? initialAvailability() {
  // Initialize a list for availability of each day of the week
  final List<AvailabilityStruct> availability = [];

  // Define the days of the week
  final List<String> daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  // Set default working hours from 9:00 AM to 5:00 PM for each day
  for (final day in daysOfWeek) {
    final startTime = DateTime(2023, 1, 1, 0, 0); // Default start time 8:00 AM
    final endTime = DateTime(2023, 1, 1, 23, 0); // Default end time 12:00 AM

    availability.add(
      AvailabilityStruct(
          dayofWeek: day, startTime: startTime, endTime: endTime),
    );
  }

  return availability;
}

DateTime? stringToTime(
  String? hourArg,
  DateTime? dateArg,
) {
  // output the combination of date from dateArg and hourArg (HH:mm format)
  if (hourArg == null || dateArg == null) {
    return null;
  }
  final hourMin = hourArg.split(':');
  final hour = int.tryParse(hourMin[0]) ?? 0;
  final minute = int.tryParse(hourMin[1]) ?? 0;
  return DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
}

bool? bookingsUpcomingClient(List<String> statuses) {
  // Check if any of the statuses are 'Pending', 'Accepted', or 'Pay'
  for (final status in statuses) {
    if (status == 'pending' || status == 'accepted' || status == 'pay') {
      return false; // Return false if any relevant status is found
    }
  }
  return true; // Return true if none of the relevant statuses are found
}

bool? bookingsPreviousClient(List<String> statuses) {
  // Check if any of the statuses are 'Pending', 'Accepted', or 'Pay'
  for (final status in statuses) {
    if (status == 'rate' ||
        status == 'completed' ||
        status == 'cancelled' ||
        status == 'rejected') {
      return false; // Return false if any relevant status is found
    }
  }
  return true; // Return true if none of the relevant statuses are found
}

bool? bookingsUpcomingSP(List<String> statuses) {
  // Check if any of the statuses are 'Pending', 'Accepted', or 'Pay'
  for (final status in statuses) {
    if (status == 'accepted' || status == 'pay') {
      return false; // Return false if any relevant status is found
    }
  }
  return true; // Return true if none of the relevant statuses are found
}

bool? bookingPreviousSP(List<String> statuses) {
  // Check if any of the statuses are 'Pending', 'Accepted', or 'Pay'
  for (final status in statuses) {
    if (status == 'rate' || status == 'completed') {
      return false; // Return false if any relevant status is found
    }
  }
  return true; // Return true if none of the relevant statuses are found
}

bool? requestSP(List<String> statuses) {
// Check if any of the statuses are 'Pending', 'Accepted', or 'Pay'
  for (final status in statuses) {
    if (status == 'pending') {
      return false; // Return false if any relevant status is found
    }
  }
  return true; // Return true if none of the relevant statuses are found
}
