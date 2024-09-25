import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientRecord extends FirestoreRecord {
  ClientRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ClientDateOfBirth" field.
  String? _clientDateOfBirth;
  String get clientDateOfBirth => _clientDateOfBirth ?? '';
  bool hasClientDateOfBirth() => _clientDateOfBirth != null;

  // "ClientFName" field.
  String? _clientFName;
  String get clientFName => _clientFName ?? '';
  bool hasClientFName() => _clientFName != null;

  // "ClientGender" field.
  String? _clientGender;
  String get clientGender => _clientGender ?? '';
  bool hasClientGender() => _clientGender != null;

  // "ClientLName" field.
  String? _clientLName;
  String get clientLName => _clientLName ?? '';
  bool hasClientLName() => _clientLName != null;

  // "ClientPhoneNumber" field.
  int? _clientPhoneNumber;
  int get clientPhoneNumber => _clientPhoneNumber ?? 0;
  bool hasClientPhoneNumber() => _clientPhoneNumber != null;

  // "ClientLocation" field.
  LatLng? _clientLocation;
  LatLng? get clientLocation => _clientLocation;
  bool hasClientLocation() => _clientLocation != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isClient" field.
  bool? _isClient;
  bool get isClient => _isClient ?? false;
  bool hasIsClient() => _isClient != null;

  // "ClientId" field.
  DocumentReference? _clientId;
  DocumentReference? get clientId => _clientId;
  bool hasClientId() => _clientId != null;

  void _initializeFields() {
    _clientDateOfBirth = snapshotData['ClientDateOfBirth'] as String?;
    _clientFName = snapshotData['ClientFName'] as String?;
    _clientGender = snapshotData['ClientGender'] as String?;
    _clientLName = snapshotData['ClientLName'] as String?;
    _clientPhoneNumber = castToType<int>(snapshotData['ClientPhoneNumber']);
    _clientLocation = snapshotData['ClientLocation'] as LatLng?;
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isClient = snapshotData['isClient'] as bool?;
    _clientId = snapshotData['ClientId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Client');

  static Stream<ClientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientRecord.fromSnapshot(s));

  static Future<ClientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientRecord.fromSnapshot(s));

  static ClientRecord fromSnapshot(DocumentSnapshot snapshot) => ClientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientRecordData({
  String? clientDateOfBirth,
  String? clientFName,
  String? clientGender,
  String? clientLName,
  int? clientPhoneNumber,
  LatLng? clientLocation,
  String? displayName,
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isClient,
  DocumentReference? clientId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ClientDateOfBirth': clientDateOfBirth,
      'ClientFName': clientFName,
      'ClientGender': clientGender,
      'ClientLName': clientLName,
      'ClientPhoneNumber': clientPhoneNumber,
      'ClientLocation': clientLocation,
      'display_name': displayName,
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isClient': isClient,
      'ClientId': clientId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientRecordDocumentEquality implements Equality<ClientRecord> {
  const ClientRecordDocumentEquality();

  @override
  bool equals(ClientRecord? e1, ClientRecord? e2) {
    return e1?.clientDateOfBirth == e2?.clientDateOfBirth &&
        e1?.clientFName == e2?.clientFName &&
        e1?.clientGender == e2?.clientGender &&
        e1?.clientLName == e2?.clientLName &&
        e1?.clientPhoneNumber == e2?.clientPhoneNumber &&
        e1?.clientLocation == e2?.clientLocation &&
        e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isClient == e2?.isClient &&
        e1?.clientId == e2?.clientId;
  }

  @override
  int hash(ClientRecord? e) => const ListEquality().hash([
        e?.clientDateOfBirth,
        e?.clientFName,
        e?.clientGender,
        e?.clientLName,
        e?.clientPhoneNumber,
        e?.clientLocation,
        e?.displayName,
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isClient,
        e?.clientId
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientRecord;
}
