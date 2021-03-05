import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_salo/misc/classes.dart';

class Settings with ChangeNotifier, DiagnosticableTreeMixin {
  bool _validated = false;
  int _index = -2;
  Map _dataMap = Map();
  String _display = "";
  int _year = 0;
  int _day = 0;
  int _month = 0;
  String _email = "";
  String _first = "";
  String _last = "";
  String _degree = "";

  bool get validated => _validated;
  Map get dataMap => _dataMap;
  String get display => _display;
  int get index => _index;
  int get year => _year;
  int get day => _day;
  int get month => _month;
  String get email => _email;
  String get first => _first;
  String get last => _last;
  String get degree => _degree;

  void clearStudent() {
    _degree = "";
    _year = 0;
    _month = 0;
    _day = 0;
    _email = "";
    _first = "";
    _last = "";
    notifyListeners();
  }

  void newDegree(String value) {
    _degree = value;
    notifyListeners();
  }

  void newYear(int value) {
    _year = value;
    notifyListeners();
  }

  void newMonth(int value) {
    _month = value;
    notifyListeners();
  }

  void newDay(int value) {
    _day = value;
    notifyListeners();
  }

  void newEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void newFirst(String value) {
    _first = value;
    notifyListeners();
  }

  void newLast(String value) {
    _last = value;
    notifyListeners();
  }

  void newDataMap(Map value) {
    _dataMap = value;
    notifyListeners();
  }

  void newValidation(bool value) {
    _validated = value;
    notifyListeners();
  }

  void newDisplay(String value) {
    _display = value;
    notifyListeners();
  }

  void newIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
