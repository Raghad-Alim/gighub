import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailabilityRecord extends FirestoreRecord {
  AvailabilityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "availableID" field.
  String? _availableID;
  String get availableID => _availableID ?? '';
  bool hasAvailableID() => _availableID != null;

  // "SundayTimeSlots" field.
  List<String>? _sundayTimeSlots;
  List<String> get sundayTimeSlots => _sundayTimeSlots ?? const [];
  bool hasSundayTimeSlots() => _sundayTimeSlots != null;

  // "MondayTimeSlots" field.
  List<String>? _mondayTimeSlots;
  List<String> get mondayTimeSlots => _mondayTimeSlots ?? const [];
  bool hasMondayTimeSlots() => _mondayTimeSlots != null;

  // "TuesdayTimeSlots" field.
  List<String>? _tuesdayTimeSlots;
  List<String> get tuesdayTimeSlots => _tuesdayTimeSlots ?? const [];
  bool hasTuesdayTimeSlots() => _tuesdayTimeSlots != null;

  // "WednesdayTimeSlots" field.
  List<String>? _wednesdayTimeSlots;
  List<String> get wednesdayTimeSlots => _wednesdayTimeSlots ?? const [];
  bool hasWednesdayTimeSlots() => _wednesdayTimeSlots != null;

  // "ThursdayTimeSlots" field.
  List<String>? _thursdayTimeSlots;
  List<String> get thursdayTimeSlots => _thursdayTimeSlots ?? const [];
  bool hasThursdayTimeSlots() => _thursdayTimeSlots != null;

  // "FridayTimeSlots" field.
  List<String>? _fridayTimeSlots;
  List<String> get fridayTimeSlots => _fridayTimeSlots ?? const [];
  bool hasFridayTimeSlots() => _fridayTimeSlots != null;

  // "SaturdayTimeSlots" field.
  List<String>? _saturdayTimeSlots;
  List<String> get saturdayTimeSlots => _saturdayTimeSlots ?? const [];
  bool hasSaturdayTimeSlots() => _saturdayTimeSlots != null;

  // "AID" field.
  DocumentReference? _aid;
  DocumentReference? get aid => _aid;
  bool hasAid() => _aid != null;

  // "isSunday" field.
  bool? _isSunday;
  bool get isSunday => _isSunday ?? false;
  bool hasIsSunday() => _isSunday != null;

  // "isMonday" field.
  bool? _isMonday;
  bool get isMonday => _isMonday ?? false;
  bool hasIsMonday() => _isMonday != null;

  // "isTuesday" field.
  bool? _isTuesday;
  bool get isTuesday => _isTuesday ?? false;
  bool hasIsTuesday() => _isTuesday != null;

  // "isWednesday" field.
  bool? _isWednesday;
  bool get isWednesday => _isWednesday ?? false;
  bool hasIsWednesday() => _isWednesday != null;

  // "isThursday" field.
  bool? _isThursday;
  bool get isThursday => _isThursday ?? false;
  bool hasIsThursday() => _isThursday != null;

  // "isFriday" field.
  bool? _isFriday;
  bool get isFriday => _isFriday ?? false;
  bool hasIsFriday() => _isFriday != null;

  // "isSaturday" field.
  bool? _isSaturday;
  bool get isSaturday => _isSaturday ?? false;
  bool hasIsSaturday() => _isSaturday != null;

  // "SundayStart" field.
  DateTime? _sundayStart;
  DateTime? get sundayStart => _sundayStart;
  bool hasSundayStart() => _sundayStart != null;

  // "SundayEnd" field.
  DateTime? _sundayEnd;
  DateTime? get sundayEnd => _sundayEnd;
  bool hasSundayEnd() => _sundayEnd != null;

  void _initializeFields() {
    _availableID = snapshotData['availableID'] as String?;
    _sundayTimeSlots = getDataList(snapshotData['SundayTimeSlots']);
    _mondayTimeSlots = getDataList(snapshotData['MondayTimeSlots']);
    _tuesdayTimeSlots = getDataList(snapshotData['TuesdayTimeSlots']);
    _wednesdayTimeSlots = getDataList(snapshotData['WednesdayTimeSlots']);
    _thursdayTimeSlots = getDataList(snapshotData['ThursdayTimeSlots']);
    _fridayTimeSlots = getDataList(snapshotData['FridayTimeSlots']);
    _saturdayTimeSlots = getDataList(snapshotData['SaturdayTimeSlots']);
    _aid = snapshotData['AID'] as DocumentReference?;
    _isSunday = snapshotData['isSunday'] as bool?;
    _isMonday = snapshotData['isMonday'] as bool?;
    _isTuesday = snapshotData['isTuesday'] as bool?;
    _isWednesday = snapshotData['isWednesday'] as bool?;
    _isThursday = snapshotData['isThursday'] as bool?;
    _isFriday = snapshotData['isFriday'] as bool?;
    _isSaturday = snapshotData['isSaturday'] as bool?;
    _sundayStart = snapshotData['SundayStart'] as DateTime?;
    _sundayEnd = snapshotData['SundayEnd'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('availability');

  static Stream<AvailabilityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailabilityRecord.fromSnapshot(s));

  static Future<AvailabilityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvailabilityRecord.fromSnapshot(s));

  static AvailabilityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailabilityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailabilityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailabilityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailabilityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailabilityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvailabilityRecordData({
  String? availableID,
  DocumentReference? aid,
  bool? isSunday,
  bool? isMonday,
  bool? isTuesday,
  bool? isWednesday,
  bool? isThursday,
  bool? isFriday,
  bool? isSaturday,
  DateTime? sundayStart,
  DateTime? sundayEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'availableID': availableID,
      'AID': aid,
      'isSunday': isSunday,
      'isMonday': isMonday,
      'isTuesday': isTuesday,
      'isWednesday': isWednesday,
      'isThursday': isThursday,
      'isFriday': isFriday,
      'isSaturday': isSaturday,
      'SundayStart': sundayStart,
      'SundayEnd': sundayEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailabilityRecordDocumentEquality
    implements Equality<AvailabilityRecord> {
  const AvailabilityRecordDocumentEquality();

  @override
  bool equals(AvailabilityRecord? e1, AvailabilityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.availableID == e2?.availableID &&
        listEquality.equals(e1?.sundayTimeSlots, e2?.sundayTimeSlots) &&
        listEquality.equals(e1?.mondayTimeSlots, e2?.mondayTimeSlots) &&
        listEquality.equals(e1?.tuesdayTimeSlots, e2?.tuesdayTimeSlots) &&
        listEquality.equals(e1?.wednesdayTimeSlots, e2?.wednesdayTimeSlots) &&
        listEquality.equals(e1?.thursdayTimeSlots, e2?.thursdayTimeSlots) &&
        listEquality.equals(e1?.fridayTimeSlots, e2?.fridayTimeSlots) &&
        listEquality.equals(e1?.saturdayTimeSlots, e2?.saturdayTimeSlots) &&
        e1?.aid == e2?.aid &&
        e1?.isSunday == e2?.isSunday &&
        e1?.isMonday == e2?.isMonday &&
        e1?.isTuesday == e2?.isTuesday &&
        e1?.isWednesday == e2?.isWednesday &&
        e1?.isThursday == e2?.isThursday &&
        e1?.isFriday == e2?.isFriday &&
        e1?.isSaturday == e2?.isSaturday &&
        e1?.sundayStart == e2?.sundayStart &&
        e1?.sundayEnd == e2?.sundayEnd;
  }

  @override
  int hash(AvailabilityRecord? e) => const ListEquality().hash([
        e?.availableID,
        e?.sundayTimeSlots,
        e?.mondayTimeSlots,
        e?.tuesdayTimeSlots,
        e?.wednesdayTimeSlots,
        e?.thursdayTimeSlots,
        e?.fridayTimeSlots,
        e?.saturdayTimeSlots,
        e?.aid,
        e?.isSunday,
        e?.isMonday,
        e?.isTuesday,
        e?.isWednesday,
        e?.isThursday,
        e?.isFriday,
        e?.isSaturday,
        e?.sundayStart,
        e?.sundayEnd
      ]);

  @override
  bool isValidKey(Object? o) => o is AvailabilityRecord;
}
