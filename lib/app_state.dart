import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _selectedDataset =
        prefs.getStringList('ff_selectedDataset') ?? _selectedDataset;
    _firstLogin = prefs.getBool('ff_firstLogin') ?? _firstLogin;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _activeDataset =
      FirebaseFirestore.instance.doc('/user_datasets/unset');
  DocumentReference? get activeDataset => _activeDataset;
  set activeDataset(DocumentReference? _value) {
    _activeDataset = _value;
  }

  DocumentReference? _unsetDataset =
      FirebaseFirestore.instance.doc('/user_datasets/unset');
  DocumentReference? get unsetDataset => _unsetDataset;
  set unsetDataset(DocumentReference? _value) {
    _unsetDataset = _value;
  }

  List<String> _selectedDataset = [];
  List<String> get selectedDataset => _selectedDataset;
  set selectedDataset(List<String> _value) {
    _selectedDataset = _value;
    prefs.setStringList('ff_selectedDataset', _value);
  }

  void addToSelectedDataset(String _value) {
    _selectedDataset.add(_value);
    prefs.setStringList('ff_selectedDataset', _selectedDataset);
  }

  void removeFromSelectedDataset(String _value) {
    _selectedDataset.remove(_value);
    prefs.setStringList('ff_selectedDataset', _selectedDataset);
  }

  String _setQid = '';
  String get setQid => _setQid;
  set setQid(String _value) {
    _setQid = _value;
  }

  String _setEngine = '';
  String get setEngine => _setEngine;
  set setEngine(String _value) {
    _setEngine = _value;
  }

  DocumentReference? _setCompletion;
  DocumentReference? get setCompletion => _setCompletion;
  set setCompletion(DocumentReference? _value) {
    _setCompletion = _value;
  }

  int _setTopK = 5;
  int get setTopK => _setTopK;
  set setTopK(int _value) {
    _setTopK = _value;
  }

  bool _firstLogin = true;
  bool get firstLogin => _firstLogin;
  set firstLogin(bool _value) {
    _firstLogin = _value;
    prefs.setBool('ff_firstLogin', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
