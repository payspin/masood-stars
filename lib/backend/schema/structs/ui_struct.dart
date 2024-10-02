// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UiStruct extends FFFirebaseStruct {
  UiStruct({
    List<String>? ui,
    double? admin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ui = ui,
        _admin = admin,
        super(firestoreUtilData);

  // "UI" field.
  List<String>? _ui;
  List<String> get ui => _ui ?? const [];
  set ui(List<String>? val) => _ui = val;

  void updateUi(Function(List<String>) updateFn) {
    updateFn(_ui ??= []);
  }

  bool hasUi() => _ui != null;

  // "ADMIN" field.
  double? _admin;
  double get admin => _admin ?? 0.0;
  set admin(double? val) => _admin = val;

  void incrementAdmin(double amount) => admin = admin + amount;

  bool hasAdmin() => _admin != null;

  static UiStruct fromMap(Map<String, dynamic> data) => UiStruct(
        ui: getDataList(data['UI']),
        admin: castToType<double>(data['ADMIN']),
      );

  static UiStruct? maybeFromMap(dynamic data) =>
      data is Map ? UiStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'UI': _ui,
        'ADMIN': _admin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UI': serializeParam(
          _ui,
          ParamType.String,
          isList: true,
        ),
        'ADMIN': serializeParam(
          _admin,
          ParamType.double,
        ),
      }.withoutNulls;

  static UiStruct fromSerializableMap(Map<String, dynamic> data) => UiStruct(
        ui: deserializeParam<String>(
          data['UI'],
          ParamType.String,
          true,
        ),
        admin: deserializeParam(
          data['ADMIN'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UiStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UiStruct &&
        listEquality.equals(ui, other.ui) &&
        admin == other.admin;
  }

  @override
  int get hashCode => const ListEquality().hash([ui, admin]);
}

UiStruct createUiStruct({
  double? admin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UiStruct(
      admin: admin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UiStruct? updateUiStruct(
  UiStruct? uiStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    uiStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUiStructData(
  Map<String, dynamic> firestoreData,
  UiStruct? uiStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (uiStruct == null) {
    return;
  }
  if (uiStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && uiStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final uiStructData = getUiFirestoreData(uiStruct, forFieldValue);
  final nestedData = uiStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = uiStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUiFirestoreData(
  UiStruct? uiStruct, [
  bool forFieldValue = false,
]) {
  if (uiStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(uiStruct.toMap());

  // Add any Firestore field values
  uiStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUiListFirestoreData(
  List<UiStruct>? uiStructs,
) =>
    uiStructs?.map((e) => getUiFirestoreData(e, true)).toList() ?? [];
