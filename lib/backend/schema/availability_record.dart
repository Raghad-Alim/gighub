import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

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

  // "Days" field.
  List<String>? _days;
  List<String> get days => _days ?? const [];
  bool hasDays() => _days != null;

  // "StartTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  void _initializeFields() {
    _availableID = snapshotData['availableID'] as String?;
    _days = getDataList(snapshotData['Days']);
    _startTime = snapshotData['StartTime'] as String?;
    _endTime = snapshotData['EndTime'] as String?;
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
  String? startTime,
  String? endTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'availableID': availableID,
      'StartTime': startTime,
      'EndTime': endTime,
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
        listEquality.equals(e1?.days, e2?.days) &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime;
  }

  @override
  int hash(AvailabilityRecord? e) => const ListEquality()
      .hash([e?.availableID, e?.days, e?.startTime, e?.endTime]);

  @override
  bool isValidKey(Object? o) => o is AvailabilityRecord;
}
