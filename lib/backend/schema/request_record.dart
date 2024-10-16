import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestRecord extends FirestoreRecord {
  RequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "requestID" field.
  String? _requestID;
  String get requestID => _requestID ?? '';
  bool hasRequestID() => _requestID != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "bookingID" field.
  DocumentReference? _bookingID;
  DocumentReference? get bookingID => _bookingID;
  bool hasBookingID() => _bookingID != null;

  // "ClientID" field.
  DocumentReference? _clientID;
  DocumentReference? get clientID => _clientID;
  bool hasClientID() => _clientID != null;

  void _initializeFields() {
    _requestID = snapshotData['requestID'] as String?;
    _status = snapshotData['status'] as String?;
    _bookingID = snapshotData['bookingID'] as DocumentReference?;
    _clientID = snapshotData['ClientID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestRecord.fromSnapshot(s));

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestRecord.fromSnapshot(s));

  static RequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestRecordData({
  String? requestID,
  String? status,
  DocumentReference? bookingID,
  DocumentReference? clientID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'requestID': requestID,
      'status': status,
      'bookingID': bookingID,
      'ClientID': clientID,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestRecordDocumentEquality implements Equality<RequestRecord> {
  const RequestRecordDocumentEquality();

  @override
  bool equals(RequestRecord? e1, RequestRecord? e2) {
    return e1?.requestID == e2?.requestID &&
        e1?.status == e2?.status &&
        e1?.bookingID == e2?.bookingID &&
        e1?.clientID == e2?.clientID;
  }

  @override
  int hash(RequestRecord? e) => const ListEquality()
      .hash([e?.requestID, e?.status, e?.bookingID, e?.clientID]);

  @override
  bool isValidKey(Object? o) => o is RequestRecord;
}
