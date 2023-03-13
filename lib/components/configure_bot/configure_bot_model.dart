import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ConfigureBotModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for topK widget.
  TextEditingController? topKController;
  final topKMask = MaskTextInputFormatter(mask: '#');
  String? Function(BuildContext, String?)? topKControllerValidator;
  String? _topKControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return 'Numbers only, lowest value is 1, highest value is 9.';
    }
    if (val.length > 1) {
      return 'Numbers only, lowest value is 1, highest value is 9.';
    }
    if (!RegExp('^[0-9]{1,9}\$').hasMatch(val)) {
      return 'Numbers only, lowest value is 1, highest value is 9.';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for CostumCompletionConfinement widget.
  bool? costumCompletionConfinementValue;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topKControllerValidator = _topKControllerValidator;
  }

  void dispose() {
    topKController?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  /// Additional helper methods are added here.

}
