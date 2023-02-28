import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/error_message/error_message_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RetreivingGPTModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GPTquery)] action in retreivingGPT widget.
  ApiCallResponse? apiResultGPT;
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    mainMenuModel.dispose();
  }

  /// Additional helper methods are added here.

}
