import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ClientFName" field.
  String? _clientFName;
  String get clientFName => _clientFName ?? '';
  bool hasClientFName() => _clientFName != null;

  // "ratingID" field.
  String? _ratingID;
  String get ratingID => _ratingID ?? '';
  bool hasRatingID() => _ratingID != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "ServiceProviderID" field.
  DocumentReference? _serviceProviderID;
  DocumentReference? get serviceProviderID => _serviceProviderID;
  bool hasServiceProviderID() => _serviceProviderID != null;

  void _initializeFields() {
    _clientFName = snapshotData['ClientFName'] as String?;
    _ratingID = snapshotData['ratingID'] as String?;
    _review = snapshotData['review'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _serviceProviderID =
        snapshotData['ServiceProviderID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratings');

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  String? clientFName,
  String? ratingID,
  String? review,
  double? rating,
  DateTime? createdTime,
  DocumentReference? serviceProviderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ClientFName': clientFName,
      'ratingID': ratingID,
      'review': review,
      'rating': rating,
      'createdTime': createdTime,
      'ServiceProviderID': serviceProviderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.clientFName == e2?.clientFName &&
        e1?.ratingID == e2?.ratingID &&
        e1?.review == e2?.review &&
        e1?.rating == e2?.rating &&
        e1?.createdTime == e2?.createdTime &&
        e1?.serviceProviderID == e2?.serviceProviderID;
  }

  @override
  int hash(RatingsRecord? e) => const ListEquality().hash([
        e?.clientFName,
        e?.ratingID,
        e?.review,
        e?.rating,
        e?.createdTime,
        e?.serviceProviderID
      ]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
