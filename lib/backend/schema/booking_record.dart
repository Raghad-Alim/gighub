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

  // "bookingID" field.
  String? _bookingID;
  String get bookingID => _bookingID ?? '';
  bool hasBookingID() => _bookingID != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "ServiceNmae" field.
  String? _serviceNmae;
  String get serviceNmae => _serviceNmae ?? '';
  bool hasServiceNmae() => _serviceNmae != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "ClientFirstName" field.
  String? _clientFirstName;
  String get clientFirstName => _clientFirstName ?? '';
  bool hasClientFirstName() => _clientFirstName != null;

  // "ClientLastName" field.
  String? _clientLastName;
  String get clientLastName => _clientLastName ?? '';
  bool hasClientLastName() => _clientLastName != null;

  // "serviceProviderID" field.
  DocumentReference? _serviceProviderID;
  DocumentReference? get serviceProviderID => _serviceProviderID;
  bool hasServiceProviderID() => _serviceProviderID != null;

  // "clientID" field.
  DocumentReference? _clientID;
  DocumentReference? get clientID => _clientID;
  bool hasClientID() => _clientID != null;

  // "TimeOfService" field.
  List<String>? _timeOfService;
  List<String> get timeOfService => _timeOfService ?? const [];
  bool hasTimeOfService() => _timeOfService != null;

  // "DateOfService" field.
  DateTime? _dateOfService;
  DateTime? get dateOfService => _dateOfService;
  bool hasDateOfService() => _dateOfService != null;

  void _initializeFields() {
    _clientComment = snapshotData['ClientComment'] as String?;
    _bookingID = snapshotData['bookingID'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _status = snapshotData['status'] as String?;
    _email = snapshotData['email'] as String?;
    _serviceNmae = snapshotData['ServiceNmae'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _clientFirstName = snapshotData['ClientFirstName'] as String?;
    _clientLastName = snapshotData['ClientLastName'] as String?;
    _serviceProviderID =
        snapshotData['serviceProviderID'] as DocumentReference?;
    _clientID = snapshotData['clientID'] as DocumentReference?;
    _timeOfService = getDataList(snapshotData['TimeOfService']);
    _dateOfService = snapshotData['DateOfService'] as DateTime?;
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
  String? bookingID,
  int? price,
  String? status,
  String? email,
  String? serviceNmae,
  LatLng? location,
  String? clientFirstName,
  String? clientLastName,
  DocumentReference? serviceProviderID,
  DocumentReference? clientID,
  DateTime? dateOfService,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ClientComment': clientComment,
      'bookingID': bookingID,
      'price': price,
      'status': status,
      'email': email,
      'ServiceNmae': serviceNmae,
      'location': location,
      'ClientFirstName': clientFirstName,
      'ClientLastName': clientLastName,
      'serviceProviderID': serviceProviderID,
      'clientID': clientID,
      'DateOfService': dateOfService,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingRecordDocumentEquality implements Equality<BookingRecord> {
  const BookingRecordDocumentEquality();

  @override
  bool equals(BookingRecord? e1, BookingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clientComment == e2?.clientComment &&
        e1?.bookingID == e2?.bookingID &&
        e1?.price == e2?.price &&
        e1?.status == e2?.status &&
        e1?.email == e2?.email &&
        e1?.serviceNmae == e2?.serviceNmae &&
        e1?.location == e2?.location &&
        e1?.clientFirstName == e2?.clientFirstName &&
        e1?.clientLastName == e2?.clientLastName &&
        e1?.serviceProviderID == e2?.serviceProviderID &&
        e1?.clientID == e2?.clientID &&
        listEquality.equals(e1?.timeOfService, e2?.timeOfService) &&
        e1?.dateOfService == e2?.dateOfService;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality().hash([
        e?.clientComment,
        e?.bookingID,
        e?.price,
        e?.status,
        e?.email,
        e?.serviceNmae,
        e?.location,
        e?.clientFirstName,
        e?.clientLastName,
        e?.serviceProviderID,
        e?.clientID,
        e?.timeOfService,
        e?.dateOfService
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
