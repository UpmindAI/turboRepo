import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/add_dataset_widget.dart';
import '../components/chat_chunks_widget.dart';
import '../components/chat_history_widget.dart';
import '../components/configure_bot_widget.dart';
import '../components/main_menu_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? setCid;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for promptStart widget.
  TextEditingController? promptStartController;
  String? Function(BuildContext, String?)? promptStartControllerValidator;
  String? _promptStartControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in promptStart widget.
  ChatMetaRecord? createChatForm;
  // Stores action output result for [Backend Call - Create Document] action in promptStart widget.
  ChatsRecord? createMessageForm;
  // Stores action output result for [Backend Call - API (chatServer)] action in promptStart widget.
  ApiCallResponse? apiResultStartForm;
  // State field(s) for promptSend widget.
  TextEditingController? promptSendController;
  String? Function(BuildContext, String?)? promptSendControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in promptSend widget.
  ChatsRecord? chatMessageNewFromField;
  // Stores action output result for [Backend Call - API (chatServer)] action in promptSend widget.
  ApiCallResponse? apiResultzymFF;
  // Stores action output result for [Backend Call - Create Document] action in Start widget.
  ChatMetaRecord? createChatButton;
  // Stores action output result for [Backend Call - Create Document] action in Start widget.
  ChatsRecord? createMessageButton1;
  // Stores action output result for [Backend Call - API (chatServer)] action in Start widget.
  ApiCallResponse? apiResultStartButton;
  // Stores action output result for [Backend Call - Create Document] action in Send widget.
  ChatsRecord? chatMessageButton;
  // Stores action output result for [Backend Call - API (chatServer)] action in Send widget.
  ApiCallResponse? chatSendButton;
  // State field(s) for Checkbox widget.

  Map<UserDatasetsRecord, bool> checkboxValueMap = {};
  List<UserDatasetsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
    promptStartControllerValidator = _promptStartControllerValidator;
  }

  void dispose() {
    mainMenuModel.dispose();
    promptStartController?.dispose();
    promptSendController?.dispose();
  }

  /// Additional helper methods are added here.

}
