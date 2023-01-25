// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SelectAndUploadFiles extends StatefulWidget {
  const SelectAndUploadFiles({
    Key? key,
    this.userId,
    this.width,
    this.height,
    this.datasetId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? userId;
  final String? datasetId;

  @override
  _SelectAndUploadFilesState createState() => _SelectAndUploadFilesState();
}

class _SelectAndUploadFilesState extends State<SelectAndUploadFiles> {
  /// List of FIles selected by the user
  FilePickerResult? filesSelected;

  /// current active upload file
  int fileTobeUploaded = 0;

  /// select files from explorer and
  /// uploads it to firebase storage one
  /// by one while notifying user
  void selectFiles() async {
    var result = await pickFiles();
    if (result != null) {
      List<String> downloadUrls = [];
      filesSelected = result;
      for (int i = 0; i < filesSelected!.files.length; i++) {
        print("object");

        setState(() {
          fileTobeUploaded = i;
        });
        var result = await uploadFile(filesSelected!.files[i], widget.userId!);
        if (result is String) {
          downloadUrls.add(result);
        }
      }
      await uploadToFirestore(downloadUrls);
      filesSelected = null;
      setState(() {});
    }
  }

  ///
  Future<void> uploadToFirestore(List<String> downloadUrls) async {
    CollectionReference userRefrence = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('user_temp_uploads');
    DocumentReference doc = await userRefrence.doc();
    DataSetModel datasetDoc = DataSetModel(
        id: doc.id,
        datasetId: widget.datasetId!,
        fileNames: filesSelected!.files.map((e) => e.name).toList(),
        fileTypes: filesSelected!.files.map((e) => e.extension!).toList(),
        downloadUrls: downloadUrls);
    await userRefrence.doc(doc.id).set(datasetDoc.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => selectFiles(),
        child: Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(Icons.file_copy, color: Colors.white, size: 23),
                ),
                Text(
                  filesSelected == null
                      ? 'Add Documents to this Dataset'
                      : ("Uploading file " +
                          (fileTobeUploaded + 1).toString() +
                          " of " +
                          filesSelected!.files.length.toString()),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            )));
  }

  Future<String?> uploadFile(PlatformFile file, String storagePath) async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      late String fileName;
      if (!kIsWeb) {
        fileName = file.path!.split("/").last;
      } else {
        fileName = file.name;
      }
      late String downloadUrl;

      final Reference firebaseStorageRef =
          storage.ref().child("/users/$storagePath/uploads/$fileName");
      if (kIsWeb) {
        await firebaseStorageRef.putData(file.bytes!).then((snapshot) async {
          downloadUrl = await snapshot.ref.getDownloadURL();
          downloadUrl = downloadUrl.toString();
        });
      } else {}
      await firebaseStorageRef.putData(file.bytes!).then((snapshot) async {
        downloadUrl = await snapshot.ref.getDownloadURL();
        downloadUrl = downloadUrl.toString();
      });
      return downloadUrl;
    } catch (e) {
      return null;
    }
  }

  Future<FilePickerResult?> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['epub', 'pdf', 'docx', 'txt'],
    );
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }
}

/// Firestore uploadModel

class DataSetModel {
  final String id;
  final String datasetId;
  final List<String> downloadUrls;
  final List<String> fileNames;
  final List<String> fileTypes;
  DataSetModel({
    required this.id,
    required this.datasetId,
    required this.downloadUrls,
    required this.fileNames,
    required this.fileTypes,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'datasetId': datasetId,
      'downloadUrls': downloadUrls,
      'fileNames': fileNames,
      'fileTypes': fileTypes,
    };
  }

  factory DataSetModel.fromMap(Map<String, dynamic> map) {
    return DataSetModel(
      id: map['id'] ?? '',
      datasetId: map['datasetId'] ?? '',
      downloadUrls: List<String>.from(map['downloadUrls']),
      fileNames: List<String>.from(map['fileNames']),
      fileTypes: List<String>.from(map['fileTypes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataSetModel.fromJson(String source) =>
      DataSetModel.fromMap(json.decode(source));
}
