import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingRecord extends FirestoreRecord {
  BookingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ClientComment" field.
  String? _clientComment;
  String get clientComment => _clientComment ?? '';
  bool hasClientComment() => _clientComment != null;

  // "DateOfService" field.
  String? _dateOfService;
  String get dateOfService => _dateOfService ?? '';
  bool hasDateOfService() => _dateOfService != null;

  // "TimeOfService" field.
  String? _timeOfService;
  String get timeOfService => _timeOfService ?? '';
  bool hasTimeOfService() => _timeOfService != null;

  // "bookingID" field.
  String? _bookingID;
  String get bookingID => _bookingID ?? '';
  bool hasBookingID() => _bookingID != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "ServiceProviderID" field.
  DocumentReference? _serviceProviderID;
  DocumentReference? get serviceProviderID => _serviceProviderID;
  bool hasServiceProviderID() => _serviceProviderID != null;

  // "ClientID" field.
  DocumentReference? _clientID;
  DocumentReference? get clientID => _clientID;
  bool hasClientID() => _clientID != null;

  void _initializeFields() {
    _clientComment = snapshotData['ClientComment'] as String?;
    _dateOfService = snapshotData['DateOfService'] as String?;
    _timeOfService = snapshotData['TimeOfService'] as String?;
    _bookingID = snapshotData['bookingID'] as String?;
    _location = snapshotData['location'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _serviceProviderID =
        snapshotData['ServiceProviderID'] as DocumentReference?;
    _clientID = snapshotData['ClientID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking');

  static Stream<BookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingRecord.fromSnapshot(s));

  static Future<BookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingRecord.fromSnapshot(s));

  static BookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingRecordData({
  String? clientComment,
  String? dateOfService,
  String? timeOfService,
  String? bookingID,
  String? location,
  int? price,
  DocumentReference? serviceProviderID,
  DocumentReference? clientID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ClientComment': clientComment,
      'DateOfService': dateOfService,
      'TimeOfService': timeOfService,
      'bookingID': bookingID,
      'location': location,
      'price': price,
      'ServiceProviderID': serviceProviderID,
      'ClientID': clientID,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingRecordDocumentEquality implements Equality<BookingRecord> {
  const BookingRecordDocumentEquality();

  @override
  bool equals(BookingRecord? e1, BookingRecord? e2) {
    return e1?.clientComment == e2?.clientComment &&
        e1?.dateOfService == e2?.dateOfService &&
        e1?.timeOfService == e2?.timeOfService &&
        e1?.bookingID == e2?.bookingID &&
        e1?.location == e2?.location &&
        e1?.price == e2?.price &&
        e1?.serviceProviderID == e2?.serviceProviderID &&
        e1?.clientID == e2?.clientID;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality().hash([
        e?.clientComment,
        e?.dateOfService,
        e?.timeOfService,
        e?.bookingID,
        e?.location,
        e?.price,
        e?.serviceProviderID,
        e?.clientID
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
