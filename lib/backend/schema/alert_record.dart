import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlertRecord extends FirestoreRecord {
  AlertRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "AlertID" field.
  String? _alertID;
  String get alertID => _alertID ?? '';
  bool hasAlertID() => _alertID != null;

  // "BookingID" field.
  DocumentReference? _bookingID;
  DocumentReference? get bookingID => _bookingID;
  bool hasBookingID() => _bookingID != null;

  // "RequestID" field.
  DocumentReference? _requestID;
  DocumentReference? get requestID => _requestID;
  bool hasRequestID() => _requestID != null;

  void _initializeFields() {
    _alertID = snapshotData['AlertID'] as String?;
    _bookingID = snapshotData['BookingID'] as DocumentReference?;
    _requestID = snapshotData['RequestID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Alert');

  static Stream<AlertRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlertRecord.fromSnapshot(s));

  static Future<AlertRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlertRecord.fromSnapshot(s));

  static AlertRecord fromSnapshot(DocumentSnapshot snapshot) => AlertRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlertRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlertRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlertRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlertRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlertRecordData({
  String? alertID,
  DocumentReference? bookingID,
  DocumentReference? requestID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AlertID': alertID,
      'BookingID': bookingID,
      'RequestID': requestID,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlertRecordDocumentEquality implements Equality<AlertRecord> {
  const AlertRecordDocumentEquality();

  @override
  bool equals(AlertRecord? e1, AlertRecord? e2) {
    return e1?.alertID == e2?.alertID &&
        e1?.bookingID == e2?.bookingID &&
        e1?.requestID == e2?.requestID;
  }

  @override
  int hash(AlertRecord? e) =>
      const ListEquality().hash([e?.alertID, e?.bookingID, e?.requestID]);

  @override
  bool isValidKey(Object? o) => o is AlertRecord;
}
