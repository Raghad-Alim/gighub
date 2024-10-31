import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsRecord extends FirestoreRecord {
  LocationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "address" field.
  LatLng? _address;
  LatLng? get address => _address;
  bool hasAddress() => _address != null;

  // "locName" field.
  String? _locName;
  String get locName => _locName ?? '';
  bool hasLocName() => _locName != null;

  // "locID" field.
  String? _locID;
  String get locID => _locID ?? '';
  bool hasLocID() => _locID != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _address = snapshotData['address'] as LatLng?;
    _locName = snapshotData['locName'] as String?;
    _locID = snapshotData['locID'] as String?;
    _city = snapshotData['city'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locations');

  static Stream<LocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationsRecord.fromSnapshot(s));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationsRecord.fromSnapshot(s));

  static LocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationsRecordData({
  DocumentReference? owner,
  LatLng? address,
  String? locName,
  String? locID,
  String? city,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'address': address,
      'locName': locName,
      'locID': locID,
      'city': city,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationsRecordDocumentEquality implements Equality<LocationsRecord> {
  const LocationsRecordDocumentEquality();

  @override
  bool equals(LocationsRecord? e1, LocationsRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.address == e2?.address &&
        e1?.locName == e2?.locName &&
        e1?.locID == e2?.locID &&
        e1?.city == e2?.city;
  }

  @override
  int hash(LocationsRecord? e) => const ListEquality()
      .hash([e?.owner, e?.address, e?.locName, e?.locID, e?.city]);

  @override
  bool isValidKey(Object? o) => o is LocationsRecord;
}
