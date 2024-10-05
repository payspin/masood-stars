import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrganizerRecord extends FirestoreRecord {
  OrganizerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  void _initializeFields() {
    _email = snapshotData['Email'] as String?;
    _password = snapshotData['password'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Organizer');

  static Stream<OrganizerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrganizerRecord.fromSnapshot(s));

  static Future<OrganizerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrganizerRecord.fromSnapshot(s));

  static OrganizerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrganizerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrganizerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrganizerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrganizerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrganizerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrganizerRecordData({
  String? email,
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Email': email,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrganizerRecordDocumentEquality implements Equality<OrganizerRecord> {
  const OrganizerRecordDocumentEquality();

  @override
  bool equals(OrganizerRecord? e1, OrganizerRecord? e2) {
    return e1?.email == e2?.email && e1?.password == e2?.password;
  }

  @override
  int hash(OrganizerRecord? e) =>
      const ListEquality().hash([e?.email, e?.password]);

  @override
  bool isValidKey(Object? o) => o is OrganizerRecord;
}
