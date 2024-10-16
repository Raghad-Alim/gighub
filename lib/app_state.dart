import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  bool _IsSundayAvailbe = false;
  bool get IsSundayAvailbe => _IsSundayAvailbe;
  set IsSundayAvailbe(bool value) {
    _IsSundayAvailbe = value;
  }

  List<String> _Slots = [
    '8:00 - 9:00',
    '9:00 - 10:00',
    '10:00 - 11:00',
    '11:00 - 12:00',
    '12:00 - 13:00',
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
    '17 :00 - 18:00',
    '18:00 - 19:00',
    '19:00 - 20:00',
    '20:00 - 21:00',
    '21:00 - 22:00',
    '22:00 - 23:00',
    '23:00 - 00:00'
  ];
  List<String> get Slots => _Slots;
  set Slots(List<String> value) {
    _Slots = value;
  }

  void addToSlots(String value) {
    Slots.add(value);
  }

  void removeFromSlots(String value) {
    Slots.remove(value);
  }

  void removeAtIndexFromSlots(int index) {
    Slots.removeAt(index);
  }

  void updateSlotsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Slots[index] = updateFn(_Slots[index]);
  }

  void insertAtIndexInSlots(int index, String value) {
    Slots.insert(index, value);
  }

  String _photo =
      'https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg';
  String get photo => _photo;
  set photo(String value) {
    _photo = value;
  }

  List<DateTime> _datesList = [];
  List<DateTime> get datesList => _datesList;
  set datesList(List<DateTime> value) {
    _datesList = value;
  }

  void addToDatesList(DateTime value) {
    datesList.add(value);
  }

  void removeFromDatesList(DateTime value) {
    datesList.remove(value);
  }

  void removeAtIndexFromDatesList(int index) {
    datesList.removeAt(index);
  }

  void updateDatesListAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    datesList[index] = updateFn(_datesList[index]);
  }

  void insertAtIndexInDatesList(int index, DateTime value) {
    datesList.insert(index, value);
  }

  bool _TimeOnClick = false;
  bool get TimeOnClick => _TimeOnClick;
  set TimeOnClick(bool value) {
    _TimeOnClick = value;
  }

  List<DateTime> _availableSlots = [];
  List<DateTime> get availableSlots => _availableSlots;
  set availableSlots(List<DateTime> value) {
    _availableSlots = value;
  }

  void addToAvailableSlots(DateTime value) {
    availableSlots.add(value);
  }

  void removeFromAvailableSlots(DateTime value) {
    availableSlots.remove(value);
  }

  void removeAtIndexFromAvailableSlots(int index) {
    availableSlots.removeAt(index);
  }

  void updateAvailableSlotsAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    availableSlots[index] = updateFn(_availableSlots[index]);
  }

  void insertAtIndexInAvailableSlots(int index, DateTime value) {
    availableSlots.insert(index, value);
  }

  List<dynamic> _serviceProviderAvailability = [];
  List<dynamic> get serviceProviderAvailability => _serviceProviderAvailability;
  set serviceProviderAvailability(List<dynamic> value) {
    _serviceProviderAvailability = value;
  }

  void addToServiceProviderAvailability(dynamic value) {
    serviceProviderAvailability.add(value);
  }

  void removeFromServiceProviderAvailability(dynamic value) {
    serviceProviderAvailability.remove(value);
  }

  void removeAtIndexFromServiceProviderAvailability(int index) {
    serviceProviderAvailability.removeAt(index);
  }

  void updateServiceProviderAvailabilityAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    serviceProviderAvailability[index] =
        updateFn(_serviceProviderAvailability[index]);
  }

  void insertAtIndexInServiceProviderAvailability(int index, dynamic value) {
    serviceProviderAvailability.insert(index, value);
  }

  List<AvailabilityStruct> _availability = [];
  List<AvailabilityStruct> get availability => _availability;
  set availability(List<AvailabilityStruct> value) {
    _availability = value;
  }

  void addToAvailability(AvailabilityStruct value) {
    availability.add(value);
  }

  void removeFromAvailability(AvailabilityStruct value) {
    availability.remove(value);
  }

  void removeAtIndexFromAvailability(int index) {
    availability.removeAt(index);
  }

  void updateAvailabilityAtIndex(
    int index,
    AvailabilityStruct Function(AvailabilityStruct) updateFn,
  ) {
    availability[index] = updateFn(_availability[index]);
  }

  void insertAtIndexInAvailability(int index, AvailabilityStruct value) {
    availability.insert(index, value);
  }

  DateTime? _SundayStart;
  DateTime? get SundayStart => _SundayStart;
  set SundayStart(DateTime? value) {
    _SundayStart = value;
  }

  DateTime? _SundayEnd;
  DateTime? get SundayEnd => _SundayEnd;
  set SundayEnd(DateTime? value) {
    _SundayEnd = value;
  }

  List<DateTime> _Sunday = [];
  List<DateTime> get Sunday => _Sunday;
  set Sunday(List<DateTime> value) {
    _Sunday = value;
  }

  void addToSunday(DateTime value) {
    Sunday.add(value);
  }

  void removeFromSunday(DateTime value) {
    Sunday.remove(value);
  }

  void removeAtIndexFromSunday(int index) {
    Sunday.removeAt(index);
  }

  void updateSundayAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    Sunday[index] = updateFn(_Sunday[index]);
  }

  void insertAtIndexInSunday(int index, DateTime value) {
    Sunday.insert(index, value);
  }
}
