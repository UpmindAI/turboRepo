// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SelectAndUploadFiles extends StatefulWidget {
  const SelectAndUploadFiles({
    Key? key,
    this.userId,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? userId;

  @override
  _SelectAndUploadFilesState createState() => _SelectAndUploadFilesState();
}

class _SelectAndUploadFilesState extends State<SelectAndUploadFiles> {
  List<String>? filesSelected;
  int fileTobeUploaded = 0;

  void selectFiles() async {
    var result = await pickFiles();
    if (result != null) {
      filesSelected = result;
      for (int i = 0; i < filesSelected!.length; i++) {
        setState(() {
          fileTobeUploaded = i;
        });
        var result = await uploadFile(filesSelected![i], widget.userId!);
        if (result is List<String>) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(filesSelected == null
            ? 'Select Files'
            : ((fileTobeUploaded + 1).toString() +
                " / " +
                filesSelected!.length.toString())));
  }
}
