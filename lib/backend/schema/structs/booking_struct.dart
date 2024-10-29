// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BookingStruct extends FFFirebaseStruct {
  BookingStruct({
    DocumentReference? documentID,
    String? clientComment,
    String? clientFirstName,
    DocumentReference? clientID,
    String? clientLastName,
    DateTime? dateOfService,
    String? serviceNmae,
    String? serviceProviderID,
    int? timeOfService,
    String? status,
    String? clientFcmTokenS,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _documentID = documentID,
        _clientComment = clientComment,
        _clientFirstName = clientFirstName,
        _clientID = clientID,
        _clientLastName = clientLastName,
        _dateOfService = dateOfService,
        _serviceNmae = serviceNmae,
        _serviceProviderID = serviceProviderID,
        _timeOfService = timeOfService,
        _status = status,
        _clientFcmTokenS = clientFcmTokenS,
        super(firestoreUtilData);

  // "DocumentID" field.
  DocumentReference? _documentID;
  DocumentReference? get documentID => _documentID;
  set documentID(DocumentReference? val) => _documentID = val;

  bool hasDocumentID() => _documentID != null;

  // "ClientComment" field.
  String? _clientComment;
  String get clientComment => _clientComment ?? '';
  set clientComment(String? val) => _clientComment = val;

  bool hasClientComment() => _clientComment != null;

  // "ClientFirstName" field.
  String? _clientFirstName;
  String get clientFirstName => _clientFirstName ?? '';
  set clientFirstName(String? val) => _clientFirstName = val;

  bool hasClientFirstName() => _clientFirstName != null;

  // "ClientID" field.
  DocumentReference? _clientID;
  DocumentReference? get clientID => _clientID;
  set clientID(DocumentReference? val) => _clientID = val;

  bool hasClientID() => _clientID != null;

  // "ClientLastName" field.
  String? _clientLastName;
  String get clientLastName => _clientLastName ?? '';
  set clientLastName(String? val) => _clientLastName = val;

  bool hasClientLastName() => _clientLastName != null;

  // "DateOfService" field.
  DateTime? _dateOfService;
  DateTime? get dateOfService => _dateOfService;
  set dateOfService(DateTime? val) => _dateOfService = val;

  bool hasDateOfService() => _dateOfService != null;

  // "ServiceNmae" field.
  String? _serviceNmae;
  String get serviceNmae => _serviceNmae ?? '';
  set serviceNmae(String? val) => _serviceNmae = val;

  bool hasServiceNmae() => _serviceNmae != null;

  // "ServiceProviderID" field.
  String? _serviceProviderID;
  String get serviceProviderID => _serviceProviderID ?? '';
  set serviceProviderID(String? val) => _serviceProviderID = val;

  bool hasServiceProviderID() => _serviceProviderID != null;

  // "TimeOfService" field.
  int? _timeOfService;
  int get timeOfService => _timeOfService ?? 0;
  set timeOfService(int? val) => _timeOfService = val;

  void incrementTimeOfService(int amount) =>
      timeOfService = timeOfService + amount;

  bool hasTimeOfService() => _timeOfService != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "clientFcmTokenS" field.
  String? _clientFcmTokenS;
  String get clientFcmTokenS => _clientFcmTokenS ?? '';
  set clientFcmTokenS(String? val) => _clientFcmTokenS = val;

  bool hasClientFcmTokenS() => _clientFcmTokenS != null;

  static BookingStruct fromMap(Map<String, dynamic> data) => BookingStruct(
        documentID: data['DocumentID'] as DocumentReference?,
        clientComment: data['ClientComment'] as String?,
        clientFirstName: data['ClientFirstName'] as String?,
        clientID: data['ClientID'] as DocumentReference?,
        clientLastName: data['ClientLastName'] as String?,
        dateOfService: data['DateOfService'] as DateTime?,
        serviceNmae: data['ServiceNmae'] as String?,
        serviceProviderID: data['ServiceProviderID'] as String?,
        timeOfService: castToType<int>(data['TimeOfService']),
        status: data['status'] as String?,
        clientFcmTokenS: data['clientFcmTokenS'] as String?,
      );

  static BookingStruct? maybeFromMap(dynamic data) =>
      data is Map ? BookingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'DocumentID': _documentID,
        'ClientComment': _clientComment,
        'ClientFirstName': _clientFirstName,
        'ClientID': _clientID,
        'ClientLastName': _clientLastName,
        'DateOfService': _dateOfService,
        'ServiceNmae': _serviceNmae,
        'ServiceProviderID': _serviceProviderID,
        'TimeOfService': _timeOfService,
        'status': _status,
        'clientFcmTokenS': _clientFcmTokenS,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DocumentID': serializeParam(
          _documentID,
          ParamType.DocumentReference,
        ),
        'ClientComment': serializeParam(
          _clientComment,
          ParamType.String,
        ),
        'ClientFirstName': serializeParam(
          _clientFirstName,
          ParamType.String,
        ),
        'ClientID': serializeParam(
          _clientID,
          ParamType.DocumentReference,
        ),
        'ClientLastName': serializeParam(
          _clientLastName,
          ParamType.String,
        ),
        'DateOfService': serializeParam(
          _dateOfService,
          ParamType.DateTime,
        ),
        'ServiceNmae': serializeParam(
          _serviceNmae,
          ParamType.String,
        ),
        'ServiceProviderID': serializeParam(
          _serviceProviderID,
          ParamType.String,
        ),
        'TimeOfService': serializeParam(
          _timeOfService,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'clientFcmTokenS': serializeParam(
          _clientFcmTokenS,
          ParamType.String,
        ),
      }.withoutNulls;

  static BookingStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingStruct(
        documentID: deserializeParam(
          data['DocumentID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['booking'],
        ),
        clientComment: deserializeParam(
          data['ClientComment'],
          ParamType.String,
          false,
        ),
        clientFirstName: deserializeParam(
          data['ClientFirstName'],
          ParamType.String,
          false,
        ),
        clientID: deserializeParam(
          data['ClientID'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['booking'],
        ),
        clientLastName: deserializeParam(
          data['ClientLastName'],
          ParamType.String,
          false,
        ),
        dateOfService: deserializeParam(
          data['DateOfService'],
          ParamType.DateTime,
          false,
        ),
        serviceNmae: deserializeParam(
          data['ServiceNmae'],
          ParamType.String,
          false,
        ),
        serviceProviderID: deserializeParam(
          data['ServiceProviderID'],
          ParamType.String,
          false,
        ),
        timeOfService: deserializeParam(
          data['TimeOfService'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        clientFcmTokenS: deserializeParam(
          data['clientFcmTokenS'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BookingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookingStruct &&
        documentID == other.documentID &&
        clientComment == other.clientComment &&
        clientFirstName == other.clientFirstName &&
        clientID == other.clientID &&
        clientLastName == other.clientLastName &&
        dateOfService == other.dateOfService &&
        serviceNmae == other.serviceNmae &&
        serviceProviderID == other.serviceProviderID &&
        timeOfService == other.timeOfService &&
        status == other.status &&
        clientFcmTokenS == other.clientFcmTokenS;
  }

  @override
  int get hashCode => const ListEquality().hash([
        documentID,
        clientComment,
        clientFirstName,
        clientID,
        clientLastName,
        dateOfService,
        serviceNmae,
        serviceProviderID,
        timeOfService,
        status,
        clientFcmTokenS
      ]);
}

BookingStruct createBookingStruct({
  DocumentReference? documentID,
  String? clientComment,
  String? clientFirstName,
  DocumentReference? clientID,
  String? clientLastName,
  DateTime? dateOfService,
  String? serviceNmae,
  String? serviceProviderID,
  int? timeOfService,
  String? status,
  String? clientFcmTokenS,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookingStruct(
      documentID: documentID,
      clientComment: clientComment,
      clientFirstName: clientFirstName,
      clientID: clientID,
      clientLastName: clientLastName,
      dateOfService: dateOfService,
      serviceNmae: serviceNmae,
      serviceProviderID: serviceProviderID,
      timeOfService: timeOfService,
      status: status,
      clientFcmTokenS: clientFcmTokenS,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookingStruct? updateBookingStruct(
  BookingStruct? booking, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    booking
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookingStructData(
  Map<String, dynamic> firestoreData,
  BookingStruct? booking,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (booking == null) {
    return;
  }
  if (booking.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && booking.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookingData = getBookingFirestoreData(booking, forFieldValue);
  final nestedData = bookingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = booking.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookingFirestoreData(
  BookingStruct? booking, [
  bool forFieldValue = false,
]) {
  if (booking == null) {
    return {};
  }
  final firestoreData = mapToFirestore(booking.toMap());

  // Add any Firestore field values
  booking.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookingListFirestoreData(
  List<BookingStruct>? bookings,
) =>
    bookings?.map((e) => getBookingFirestoreData(e, true)).toList() ?? [];
