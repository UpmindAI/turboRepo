import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailSignup widget.
  TextEditingController? emailSignupController;
  String? Function(BuildContext, String?)? emailSignupControllerValidator;
  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    if (!RegExp('^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}\$').hasMatch(val)) {
      return 'Password needs to be at least 6 characters, and inlcude lowercase, uppercase and numbers. ';
    }
    return null;
  }

  // State field(s) for PasswordRepeat widget.
  TextEditingController? passwordRepeatController;
  late bool passwordRepeatVisibility;
  String? Function(BuildContext, String?)? passwordRepeatControllerValidator;
  String? _passwordRepeatControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    if (!RegExp('^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}\$').hasMatch(val)) {
      return 'Password needs to be at least 6 characters, and inlcude lowercase, uppercase and numbers. ';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    passwordRepeatVisibility = false;
    passwordRepeatControllerValidator = _passwordRepeatControllerValidator;
  }

  void dispose() {
    emailSignupController?.dispose();
    passwordController?.dispose();
    passwordRepeatController?.dispose();
  }

  /// Additional helper methods are added here.

}
