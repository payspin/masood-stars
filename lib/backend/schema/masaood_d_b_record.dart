import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MasaoodDBRecord extends FirestoreRecord {
  MasaoodDBRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "PrimarySmtpAddress" field.
  String? _primarySmtpAddress;
  String get primarySmtpAddress => _primarySmtpAddress ?? '';
  bool hasPrimarySmtpAddress() => _primarySmtpAddress != null;

  // "Domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  bool hasDomain() => _domain != null;

  // "Department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _firstName = snapshotData['FirstName'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _primarySmtpAddress = snapshotData['PrimarySmtpAddress'] as String?;
    _domain = snapshotData['Domain'] as String?;
    _department = snapshotData['Department'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('masaoodDB');

  static Stream<MasaoodDBRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MasaoodDBRecord.fromSnapshot(s));

  static Future<MasaoodDBRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MasaoodDBRecord.fromSnapshot(s));

  static MasaoodDBRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MasaoodDBRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MasaoodDBRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MasaoodDBRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MasaoodDBRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MasaoodDBRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMasaoodDBRecordData({
  String? name,
  String? firstName,
  String? lastName,
  String? primarySmtpAddress,
  String? domain,
  String? department,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'FirstName': firstName,
      'LastName': lastName,
      'PrimarySmtpAddress': primarySmtpAddress,
      'Domain': domain,
      'Department': department,
    }.withoutNulls,
  );

  return firestoreData;
}

class MasaoodDBRecordDocumentEquality implements Equality<MasaoodDBRecord> {
  const MasaoodDBRecordDocumentEquality();

  @override
  bool equals(MasaoodDBRecord? e1, MasaoodDBRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.primarySmtpAddress == e2?.primarySmtpAddress &&
        e1?.domain == e2?.domain &&
        e1?.department == e2?.department;
  }

  @override
  int hash(MasaoodDBRecord? e) => const ListEquality().hash([
        e?.name,
        e?.firstName,
        e?.lastName,
        e?.primarySmtpAddress,
        e?.domain,
        e?.department
      ]);

  @override
  bool isValidKey(Object? o) => o is MasaoodDBRecord;
}
