import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrDataRecord extends FirestoreRecord {
  QrDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "qrdata" field.
  String? _qrdata;
  String get qrdata => _qrdata ?? '';
  bool hasQrdata() => _qrdata != null;

  void _initializeFields() {
    _qrdata = snapshotData['qrdata'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('qrData');

  static Stream<QrDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrDataRecord.fromSnapshot(s));

  static Future<QrDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrDataRecord.fromSnapshot(s));

  static QrDataRecord fromSnapshot(DocumentSnapshot snapshot) => QrDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrDataRecordData({
  String? qrdata,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qrdata': qrdata,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrDataRecordDocumentEquality implements Equality<QrDataRecord> {
  const QrDataRecordDocumentEquality();

  @override
  bool equals(QrDataRecord? e1, QrDataRecord? e2) {
    return e1?.qrdata == e2?.qrdata;
  }

  @override
  int hash(QrDataRecord? e) => const ListEquality().hash([e?.qrdata]);

  @override
  bool isValidKey(Object? o) => o is QrDataRecord;
}
