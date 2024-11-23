import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceProviderRecord extends FirestoreRecord {
  ServiceProviderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userIdNotification" field.
  DocumentReference? _userIdNotification;
  DocumentReference? get userIdNotification => _userIdNotification;
  bool hasUserIdNotification() => _userIdNotification != null;

  // "titleNotification" field.
  String? _titleNotification;
  String get titleNotification => _titleNotification ?? '';
  bool hasTitleNotification() => _titleNotification != null;

  // "bodyNotification" field.
  String? _bodyNotification;
  String get bodyNotification => _bodyNotification ?? '';
  bool hasBodyNotification() => _bodyNotification != null;

  // "timeStampNotification" field.
  DateTime? _timeStampNotification;
  DateTime? get timeStampNotification => _timeStampNotification;
  bool hasTimeStampNotification() => _timeStampNotification != null;

  void _initializeFields() {
    _userIdNotification =
        snapshotData['userIdNotification'] as DocumentReference?;
    _titleNotification = snapshotData['titleNotification'] as String?;
    _bodyNotification = snapshotData['bodyNotification'] as String?;
    _timeStampNotification = snapshotData['timeStampNotification'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ServiceProvider');

  static Stream<ServiceProviderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceProviderRecord.fromSnapshot(s));

  static Future<ServiceProviderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceProviderRecord.fromSnapshot(s));

  static ServiceProviderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceProviderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceProviderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceProviderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceProviderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceProviderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceProviderRecordData({
  DocumentReference? userIdNotification,
  String? titleNotification,
  String? bodyNotification,
  DateTime? timeStampNotification,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userIdNotification': userIdNotification,
      'titleNotification': titleNotification,
      'bodyNotification': bodyNotification,
      'timeStampNotification': timeStampNotification,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceProviderRecordDocumentEquality
    implements Equality<ServiceProviderRecord> {
  const ServiceProviderRecordDocumentEquality();

  @override
  bool equals(ServiceProviderRecord? e1, ServiceProviderRecord? e2) {
    return e1?.userIdNotification == e2?.userIdNotification &&
        e1?.titleNotification == e2?.titleNotification &&
        e1?.bodyNotification == e2?.bodyNotification &&
        e1?.timeStampNotification == e2?.timeStampNotification;
  }

  @override
  int hash(ServiceProviderRecord? e) => const ListEquality().hash([
        e?.userIdNotification,
        e?.titleNotification,
        e?.bodyNotification,
        e?.timeStampNotification
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceProviderRecord;
}
