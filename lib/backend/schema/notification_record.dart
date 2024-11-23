import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "postid" field.
  String? _postid;
  String get postid => _postid ?? '';
  bool hasPostid() => _postid != null;

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
    _userid = snapshotData['userid'] as DocumentReference?;
    _postid = snapshotData['postid'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? userid,
  String? postid,
  DateTime? timestamp,
  String? title,
  String? body,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'postid': postid,
      'timestamp': timestamp,
      'title': title,
      'body': body,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.userid == e2?.userid &&
        e1?.postid == e2?.postid &&
        e1?.timestamp == e2?.timestamp &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality()
      .hash([e?.userid, e?.postid, e?.timestamp, e?.title, e?.body]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
