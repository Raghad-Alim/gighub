import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "DateOfBirth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "isClient" field.
  bool? _isClient;
  bool get isClient => _isClient ?? false;
  bool hasIsClient() => _isClient != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "sector" field.
  String? _sector;
  String get sector => _sector ?? '';
  bool hasSector() => _sector != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "tatalRating" field.
  int? _tatalRating;
  int get tatalRating => _tatalRating ?? 0;
  bool hasTatalRating() => _tatalRating != null;

  // "aveageRating" field.
  double? _aveageRating;
  double get aveageRating => _aveageRating ?? 0.0;
  bool hasAveageRating() => _aveageRating != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "User_history" field.
  List<DocumentReference>? _userHistory;
  List<DocumentReference> get userHistory => _userHistory ?? const [];
  bool hasUserHistory() => _userHistory != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _dateOfBirth = snapshotData['DateOfBirth'] as String?;
    _firstName = snapshotData['FirstName'] as String?;
    _email = snapshotData['email'] as String?;
    _isClient = snapshotData['isClient'] as bool?;
    _price = castToType<int>(snapshotData['price']);
    _role = snapshotData['role'] as String?;
    _sector = snapshotData['sector'] as String?;
    _gender = snapshotData['gender'] as String?;
    _tatalRating = castToType<int>(snapshotData['tatalRating']);
    _aveageRating = castToType<double>(snapshotData['aveageRating']);
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _bio = snapshotData['Bio'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _userHistory = getDataList(snapshotData['User_history']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? photoUrl,
  String? phoneNumber,
  String? dateOfBirth,
  String? firstName,
  String? email,
  bool? isClient,
  int? price,
  String? role,
  String? sector,
  String? gender,
  int? tatalRating,
  double? aveageRating,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? bio,
  String? lastName,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'DateOfBirth': dateOfBirth,
      'FirstName': firstName,
      'email': email,
      'isClient': isClient,
      'price': price,
      'role': role,
      'sector': sector,
      'gender': gender,
      'tatalRating': tatalRating,
      'aveageRating': aveageRating,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'Bio': bio,
      'LastName': lastName,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.firstName == e2?.firstName &&
        e1?.email == e2?.email &&
        e1?.isClient == e2?.isClient &&
        e1?.price == e2?.price &&
        e1?.role == e2?.role &&
        e1?.sector == e2?.sector &&
        e1?.gender == e2?.gender &&
        e1?.tatalRating == e2?.tatalRating &&
        e1?.aveageRating == e2?.aveageRating &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bio == e2?.bio &&
        e1?.lastName == e2?.lastName &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.userHistory, e2?.userHistory);
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.photoUrl,
        e?.phoneNumber,
        e?.dateOfBirth,
        e?.firstName,
        e?.email,
        e?.isClient,
        e?.price,
        e?.role,
        e?.sector,
        e?.gender,
        e?.tatalRating,
        e?.aveageRating,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.bio,
        e?.lastName,
        e?.location,
        e?.userHistory
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
