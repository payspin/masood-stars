import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "Department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "IDnumber" field.
  String? _iDnumber;
  String get iDnumber => _iDnumber ?? '';
  bool hasIDnumber() => _iDnumber != null;

  // "Color_Code" field.
  String? _colorCode;
  String get colorCode => _colorCode ?? '';
  bool hasColorCode() => _colorCode != null;

  // "Admin" field.
  String? _admin;
  String get admin => _admin ?? '';
  bool hasAdmin() => _admin != null;

  // "Event_manager" field.
  bool? _eventManager;
  bool get eventManager => _eventManager ?? false;
  bool hasEventManager() => _eventManager != null;

  // "qrCodeUrl" field.
  String? _qrCodeUrl;
  String get qrCodeUrl => _qrCodeUrl ?? '';
  bool hasQrCodeUrl() => _qrCodeUrl != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _department = snapshotData['Department'] as String?;
    _password = snapshotData['Password'] as String?;
    _iDnumber = snapshotData['IDnumber'] as String?;
    _colorCode = snapshotData['Color_Code'] as String?;
    _admin = snapshotData['Admin'] as String?;
    _eventManager = snapshotData['Event_manager'] as bool?;
    _qrCodeUrl = snapshotData['qrCodeUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? department,
  String? password,
  String? iDnumber,
  String? colorCode,
  String? admin,
  bool? eventManager,
  String? qrCodeUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Department': department,
      'Password': password,
      'IDnumber': iDnumber,
      'Color_Code': colorCode,
      'Admin': admin,
      'Event_manager': eventManager,
      'qrCodeUrl': qrCodeUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.department == e2?.department &&
        e1?.password == e2?.password &&
        e1?.iDnumber == e2?.iDnumber &&
        e1?.colorCode == e2?.colorCode &&
        e1?.admin == e2?.admin &&
        e1?.eventManager == e2?.eventManager &&
        e1?.qrCodeUrl == e2?.qrCodeUrl;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.department,
        e?.password,
        e?.iDnumber,
        e?.colorCode,
        e?.admin,
        e?.eventManager,
        e?.qrCodeUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
