import 'package:flutter/material.dart';

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
}
