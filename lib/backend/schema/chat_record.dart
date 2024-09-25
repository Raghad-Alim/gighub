import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ChatID" field.
  String? _chatID;
  String get chatID => _chatID ?? '';
  bool hasChatID() => _chatID != null;

  // "ClientID" field.
  DocumentReference? _clientID;
  DocumentReference? get clientID => _clientID;
  bool hasClientID() => _clientID != null;

  // "erviceProviderID" field.
  DocumentReference? _erviceProviderID;
  DocumentReference? get erviceProviderID => _erviceProviderID;
  bool hasErviceProviderID() => _erviceProviderID != null;

  // "massage" field.
  String? _massage;
  String get massage => _massage ?? '';
  bool hasMassage() => _massage != null;

  void _initializeFields() {
    _chatID = snapshotData['ChatID'] as String?;
    _clientID = snapshotData['ClientID'] as DocumentReference?;
    _erviceProviderID = snapshotData['erviceProviderID'] as DocumentReference?;
    _massage = snapshotData['massage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? chatID,
  DocumentReference? clientID,
  DocumentReference? erviceProviderID,
  String? massage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ChatID': chatID,
      'ClientID': clientID,
      'erviceProviderID': erviceProviderID,
      'massage': massage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    return e1?.chatID == e2?.chatID &&
        e1?.clientID == e2?.clientID &&
        e1?.erviceProviderID == e2?.erviceProviderID &&
        e1?.massage == e2?.massage;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality()
      .hash([e?.chatID, e?.clientID, e?.erviceProviderID, e?.massage]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
