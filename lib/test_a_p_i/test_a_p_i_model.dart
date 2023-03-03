import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/error_message/error_message_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestAPIModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserPromptsRecord? setPrompttextMIX;
  // Stores action output result for [Backend Call - API (MixedQuery)] action in Button widget.
  ApiCallResponse? apiResultMIXtest;
  // Stores action output result for [Backend Call - API (MixedChat)] action in Button widget.
  ApiCallResponse? chatAPItest;
  // Stores action output result for [Backend Call - API (testAPI)] action in Button widget.
  ApiCallResponse? testAPIresult;
  // State field(s) for Guardrail widget.
  bool? guardrailValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
