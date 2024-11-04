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

  int _totalGuests = 0;
  int get totalGuests => _totalGuests;
  set totalGuests(int value) {
    _totalGuests = value;
  }

  int _totalArrived = 0;
  int get totalArrived => _totalArrived;
  set totalArrived(int value) {
    _totalArrived = value;
  }

  int _totalRegistered = 0;
  int get totalRegistered => _totalRegistered;
  set totalRegistered(int value) {
    _totalRegistered = value;
  }

  String _registerguestEmail = '';
  String get registerguestEmail => _registerguestEmail;
  set registerguestEmail(String value) {
    _registerguestEmail = value;
  }

  String _HowManyRegisteredG = '';
  String get HowManyRegisteredG => _HowManyRegisteredG;
  set HowManyRegisteredG(String value) {
    _HowManyRegisteredG = value;
  }

  String _employeeNum = '';
  String get employeeNum => _employeeNum;
  set employeeNum(String value) {
    _employeeNum = value;
  }

  bool _searchisactive = true;
  bool get searchisactive => _searchisactive;
  set searchisactive(bool value) {
    _searchisactive = value;
  }

  int _GuestTotalwoEventManager = 0;
  int get GuestTotalwoEventManager => _GuestTotalwoEventManager;
  set GuestTotalwoEventManager(int value) {
    _GuestTotalwoEventManager = value;
  }

  int _totalNotarrived = 0;
  int get totalNotarrived => _totalNotarrived;
  set totalNotarrived(int value) {
    _totalNotarrived = value;
  }

  String _ScanResult = 'QrCode Scan result';
  String get ScanResult => _ScanResult;
  set ScanResult(String value) {
    _ScanResult = value;
  }

  String _QrCodeScanCheck = 'Arrived';
  String get QrCodeScanCheck => _QrCodeScanCheck;
  set QrCodeScanCheck(String value) {
    _QrCodeScanCheck = value;
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
