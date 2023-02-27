import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RetreivingTestModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (testAPI)] action in retreivingTest widget.
  ApiCallResponse? testAPIresult;
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // Stores action output result for [Backend Call - API (testAPI)] action in Button widget.
  ApiCallResponse? testAPIresult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    mainMenuModel.dispose();
  }

  /// Additional helper methods are added here.

}
