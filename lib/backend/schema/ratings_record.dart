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

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "ratingID" field.
  String? _ratingID;
  String get ratingID => _ratingID ?? '';
  bool hasRatingID() => _ratingID != null;

  // "ServiceProviderID" field.
  DocumentReference? _serviceProviderID;
  DocumentReference? get serviceProviderID => _serviceProviderID;
  bool hasServiceProviderID() => _serviceProviderID != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  void _initializeFields() {
    _clientFName = snapshotData['ClientFName'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _ratingID = snapshotData['ratingID'] as String?;
    _serviceProviderID =
        snapshotData['ServiceProviderID'] as DocumentReference?;
    _review = snapshotData['review'] as String?;
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
  int? rating,
  String? ratingID,
  DocumentReference? serviceProviderID,
  String? review,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ClientFName': clientFName,
      'rating': rating,
      'ratingID': ratingID,
      'ServiceProviderID': serviceProviderID,
      'review': review,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.clientFName == e2?.clientFName &&
        e1?.rating == e2?.rating &&
        e1?.ratingID == e2?.ratingID &&
        e1?.serviceProviderID == e2?.serviceProviderID &&
        e1?.review == e2?.review;
  }

  @override
  int hash(RatingsRecord? e) => const ListEquality().hash([
        e?.clientFName,
        e?.rating,
        e?.ratingID,
        e?.serviceProviderID,
        e?.review
      ]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
