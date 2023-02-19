import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_dataset_widget.dart';
import '../components/main_menu_widget.dart';
import '../components/payment_widget.dart';
import '../components/prompt_config_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for PromptField widget.
  TextEditingController? promptFieldController;
  String? Function(BuildContext, String?)? promptFieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in ButtonMix widget.
  UserPromptsRecord? setPrompt;
  // Stores action output result for [Backend Call - Create Document] action in ButtonSummarize widget.
  UserPromptsRecord? setPromptSummarize;
  // Stores action output result for [Backend Call - Create Document] action in ButtonGPT widget.
  UserPromptsRecord? setPromptGPT;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // State field(s) for Checkbox widget.

  Map<UserDatasetsRecord, bool> checkboxValueMap = {};
  List<UserDatasetsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  void dispose() {
    mainMenuModel.dispose();
    promptFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
