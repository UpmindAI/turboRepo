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
    _setChunkSize = prefs.getDouble('ff_setChunkSize') ?? _setChunkSize;
    _selectedDocuments =
        prefs.getStringList('ff_selectedDocuments') ?? _selectedDocuments;
    _setCid = prefs.getString('ff_setCid') ?? _setCid;
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

  void removeAtIndexFromSelectedDataset(int _index) {
    _selectedDataset.removeAt(_index);
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

  double _setTopK = 5;
  double get setTopK => _setTopK;
  set setTopK(double _value) {
    _setTopK = _value;
  }

  double _setChunkSize = 0.0;
  double get setChunkSize => _setChunkSize;
  set setChunkSize(double _value) {
    _setChunkSize = _value;
    prefs.setDouble('ff_setChunkSize', _value);
  }

  List<String> _selectedDocuments = [];
  List<String> get selectedDocuments => _selectedDocuments;
  set selectedDocuments(List<String> _value) {
    _selectedDocuments = _value;
    prefs.setStringList('ff_selectedDocuments', _value);
  }

  void addToSelectedDocuments(String _value) {
    _selectedDocuments.add(_value);
    prefs.setStringList('ff_selectedDocuments', _selectedDocuments);
  }

  void removeFromSelectedDocuments(String _value) {
    _selectedDocuments.remove(_value);
    prefs.setStringList('ff_selectedDocuments', _selectedDocuments);
  }

  void removeAtIndexFromSelectedDocuments(int _index) {
    _selectedDocuments.removeAt(_index);
    prefs.setStringList('ff_selectedDocuments', _selectedDocuments);
  }

  bool _sourcesOn = false;
  bool get sourcesOn => _sourcesOn;
  set sourcesOn(bool _value) {
    _sourcesOn = _value;
  }

  String _setCid = '';
  String get setCid => _setCid;
  set setCid(String _value) {
    _setCid = _value;
    prefs.setString('ff_setCid', _value);
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
