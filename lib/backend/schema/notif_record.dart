import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotifRecord extends FirestoreRecord {
  NotifRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notif');

  static Stream<NotifRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotifRecord.fromSnapshot(s));

  static Future<NotifRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotifRecord.fromSnapshot(s));

  static NotifRecord fromSnapshot(DocumentSnapshot snapshot) => NotifRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotifRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotifRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotifRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotifRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotifRecordData({
  DocumentReference? userRef,
  DateTime? timestamp,
  String? title,
  String? body,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'timestamp': timestamp,
      'title': title,
      'body': body,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotifRecordDocumentEquality implements Equality<NotifRecord> {
  const NotifRecordDocumentEquality();

  @override
  bool equals(NotifRecord? e1, NotifRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body;
  }

  @override
  int hash(NotifRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.timestamp, e?.title, e?.body]);

  @override
  bool isValidKey(Object? o) => o is NotifRecord;
}
