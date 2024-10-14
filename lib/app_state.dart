import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<bool> _Eventmanager = [];
  List<bool> get Eventmanager => _Eventmanager;
  set Eventmanager(List<bool> value) {
    _Eventmanager = value;
  }

  void addToEventmanager(bool value) {
    Eventmanager.add(value);
  }

  void removeFromEventmanager(bool value) {
    Eventmanager.remove(value);
  }

  void removeAtIndexFromEventmanager(int index) {
    Eventmanager.removeAt(index);
  }

  void updateEventmanagerAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    Eventmanager[index] = updateFn(_Eventmanager[index]);
  }

  void insertAtIndexInEventmanager(int index, bool value) {
    Eventmanager.insert(index, value);
  }

  int _RdRandomPick = 0;
  int get RdRandomPick => _RdRandomPick;
  set RdRandomPick(int value) {
    _RdRandomPick = value;
  }

  String _IndexingValue = '';
  String get IndexingValue => _IndexingValue;
  set IndexingValue(String value) {
    _IndexingValue = value;
  }

  String _RdPickResult = '0';
  String get RdPickResult => _RdPickResult;
  set RdPickResult(String value) {
    _RdPickResult = value;
  }

  String _guestEmail = '';
  String get guestEmail => _guestEmail;
  set guestEmail(String value) {
    _guestEmail = value;
  }

  String _employeeName = '';
  String get employeeName => _employeeName;
  set employeeName(String value) {
    _employeeName = value;
  }

  String _guestFirstName = '';
  String get guestFirstName => _guestFirstName;
  set guestFirstName(String value) {
    _guestFirstName = value;
  }

  String _guestLastName = '';
  String get guestLastName => _guestLastName;
  set guestLastName(String value) {
    _guestLastName = value;
  }

  String _guestDepartment = '';
  String get guestDepartment => _guestDepartment;
  set guestDepartment(String value) {
    _guestDepartment = value;
  }

  String _emailStrange = '';
  String get emailStrange => _emailStrange;
  set emailStrange(String value) {
    _emailStrange = value;
  }

  final _winnersManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> winners({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _winnersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWinnersCache() => _winnersManager.clear();
  void clearWinnersCacheKey(String? uniqueKey) =>
      _winnersManager.clearRequest(uniqueKey);
}
