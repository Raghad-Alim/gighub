import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceProviderRecord extends FirestoreRecord {
  ServiceProviderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CV" field.
  String? _cv;
  String get cv => _cv ?? '';
  bool hasCv() => _cv != null;

  // "SPDateOfBirth" field.
  String? _sPDateOfBirth;
  String get sPDateOfBirth => _sPDateOfBirth ?? '';
  bool hasSPDateOfBirth() => _sPDateOfBirth != null;

  // "SPFName" field.
  String? _sPFName;
  String get sPFName => _sPFName ?? '';
  bool hasSPFName() => _sPFName != null;

  // "SPGender" field.
  String? _sPGender;
  String get sPGender => _sPGender ?? '';
  bool hasSPGender() => _sPGender != null;

  // "SPLName" field.
  String? _sPLName;
  String get sPLName => _sPLName ?? '';
  bool hasSPLName() => _sPLName != null;

  // "SPPhoneNumber" field.
  String? _sPPhoneNumber;
  String get sPPhoneNumber => _sPPhoneNumber ?? '';
  bool hasSPPhoneNumber() => _sPPhoneNumber != null;

  // "SPPrice" field.
  String? _sPPrice;
  String get sPPrice => _sPPrice ?? '';
  bool hasSPPrice() => _sPPrice != null;

  // "Sector" field.
  String? _sector;
  String get sector => _sector ?? '';
  bool hasSector() => _sector != null;

  // "ServiceProviderID" field.
  String? _serviceProviderID;
  String get serviceProviderID => _serviceProviderID ?? '';
  bool hasServiceProviderID() => _serviceProviderID != null;

  // "Skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  bool hasSkills() => _skills != null;

  // "SPLocation" field.
  LatLng? _sPLocation;
  LatLng? get sPLocation => _sPLocation;
  bool hasSPLocation() => _sPLocation != null;

  // "ProfilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

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

  // "isServiceProvider" field.
  bool? _isServiceProvider;
  bool get isServiceProvider => _isServiceProvider ?? false;
  bool hasIsServiceProvider() => _isServiceProvider != null;

  // "isClientt" field.
  bool? _isClientt;
  bool get isClientt => _isClientt ?? false;
  bool hasIsClientt() => _isClientt != null;

  // "AverageRating" field.
  double? _averageRating;
  double get averageRating => _averageRating ?? 0.0;
  bool hasAverageRating() => _averageRating != null;

  // "totalRatings" field.
  int? _totalRatings;
  int get totalRatings => _totalRatings ?? 0;
  bool hasTotalRatings() => _totalRatings != null;

  void _initializeFields() {
    _cv = snapshotData['CV'] as String?;
    _sPDateOfBirth = snapshotData['SPDateOfBirth'] as String?;
    _sPFName = snapshotData['SPFName'] as String?;
    _sPGender = snapshotData['SPGender'] as String?;
    _sPLName = snapshotData['SPLName'] as String?;
    _sPPhoneNumber = snapshotData['SPPhoneNumber'] as String?;
    _sPPrice = snapshotData['SPPrice'] as String?;
    _sector = snapshotData['Sector'] as String?;
    _serviceProviderID = snapshotData['ServiceProviderID'] as String?;
    _skills = getDataList(snapshotData['Skills']);
    _sPLocation = snapshotData['SPLocation'] as LatLng?;
    _profilePicture = snapshotData['ProfilePicture'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isServiceProvider = snapshotData['isServiceProvider'] as bool?;
    _isClientt = snapshotData['isClientt'] as bool?;
    _averageRating = castToType<double>(snapshotData['AverageRating']);
    _totalRatings = castToType<int>(snapshotData['totalRatings']);
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
  String? cv,
  String? sPDateOfBirth,
  String? sPFName,
  String? sPGender,
  String? sPLName,
  String? sPPhoneNumber,
  String? sPPrice,
  String? sector,
  String? serviceProviderID,
  LatLng? sPLocation,
  String? profilePicture,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isServiceProvider,
  bool? isClientt,
  double? averageRating,
  int? totalRatings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CV': cv,
      'SPDateOfBirth': sPDateOfBirth,
      'SPFName': sPFName,
      'SPGender': sPGender,
      'SPLName': sPLName,
      'SPPhoneNumber': sPPhoneNumber,
      'SPPrice': sPPrice,
      'Sector': sector,
      'ServiceProviderID': serviceProviderID,
      'SPLocation': sPLocation,
      'ProfilePicture': profilePicture,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isServiceProvider': isServiceProvider,
      'isClientt': isClientt,
      'AverageRating': averageRating,
      'totalRatings': totalRatings,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceProviderRecordDocumentEquality
    implements Equality<ServiceProviderRecord> {
  const ServiceProviderRecordDocumentEquality();

  @override
  bool equals(ServiceProviderRecord? e1, ServiceProviderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cv == e2?.cv &&
        e1?.sPDateOfBirth == e2?.sPDateOfBirth &&
        e1?.sPFName == e2?.sPFName &&
        e1?.sPGender == e2?.sPGender &&
        e1?.sPLName == e2?.sPLName &&
        e1?.sPPhoneNumber == e2?.sPPhoneNumber &&
        e1?.sPPrice == e2?.sPPrice &&
        e1?.sector == e2?.sector &&
        e1?.serviceProviderID == e2?.serviceProviderID &&
        listEquality.equals(e1?.skills, e2?.skills) &&
        e1?.sPLocation == e2?.sPLocation &&
        e1?.profilePicture == e2?.profilePicture &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isServiceProvider == e2?.isServiceProvider &&
        e1?.isClientt == e2?.isClientt &&
        e1?.averageRating == e2?.averageRating &&
        e1?.totalRatings == e2?.totalRatings;
  }

  @override
  int hash(ServiceProviderRecord? e) => const ListEquality().hash([
        e?.cv,
        e?.sPDateOfBirth,
        e?.sPFName,
        e?.sPGender,
        e?.sPLName,
        e?.sPPhoneNumber,
        e?.sPPrice,
        e?.sector,
        e?.serviceProviderID,
        e?.skills,
        e?.sPLocation,
        e?.profilePicture,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isServiceProvider,
        e?.isClientt,
        e?.averageRating,
        e?.totalRatings
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceProviderRecord;
}
