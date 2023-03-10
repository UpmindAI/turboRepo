import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/add_dataset/add_dataset_widget.dart';
import '/components/chat_chunks/chat_chunks_widget.dart';
import '/components/chat_history/chat_history_widget.dart';
import '/components/configure_bot/configure_bot_widget.dart';
import '/components/main_menu/main_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? setCid;

  bool multiLine = false;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for chatColumn widget.
  ScrollController? chatColumn;
  // State field(s) for startField widget.
  TextEditingController? startFieldController1;
  String? Function(BuildContext, String?)? startFieldController1Validator;
  String? _startFieldController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatMetaRecord? createChatFormML;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createMessageFormML;
  // Stores action output result for [Backend Call - API (MixedChat)] action in Button widget.
  ApiCallResponse? apiResultStartFormML;
  // State field(s) for sendField widget.
  TextEditingController? sendFieldController1;
  String? Function(BuildContext, String?)? sendFieldController1Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chatMessageNewFromFieldSL;
  // Stores action output result for [Backend Call - API (MixedChat)] action in Button widget.
  ApiCallResponse? apiResulchatSL;
  // State field(s) for startField widget.
  TextEditingController? startFieldController2;
  String? Function(BuildContext, String?)? startFieldController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in startField widget.
  ChatMetaRecord? createChatForm;
  // Stores action output result for [Backend Call - Create Document] action in startField widget.
  ChatsRecord? createMessageForm;
  // Stores action output result for [Backend Call - API (MixedChat)] action in startField widget.
  ApiCallResponse? apiResultStartForm;
  // State field(s) for sendField widget.
  TextEditingController? sendFieldController2;
  String? Function(BuildContext, String?)? sendFieldController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in sendField widget.
  ChatsRecord? chatMessageNewFromField;
  // Stores action output result for [Backend Call - API (MixedChat)] action in sendField widget.
  ApiCallResponse? apiResultzymFF;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Checkbox widget.

  Map<UserDatasetsRecord, bool> checkboxValueMap = {};
  List<UserDatasetsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
    chatColumn = ScrollController();
    startFieldController1Validator = _startFieldController1Validator;
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  void dispose() {
    mainMenuModel.dispose();
    chatColumn?.dispose();
    startFieldController1?.dispose();
    sendFieldController1?.dispose();
    startFieldController2?.dispose();
    sendFieldController2?.dispose();
    columnController?.dispose();
    listViewController?.dispose();
  }

  /// Additional helper methods are added here.

}
