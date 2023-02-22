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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
    this.userCompletion,
  }) : super(key: key);

  final UserCompletionsRecord? userCompletion;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.promptFieldController ??= TextEditingController(
        text: widget.userCompletion != null
            ? '${widget.userCompletion!.prompt}${widget.userCompletion!.completion}'
            : '');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/images/Logo-OMP-122-40.png',
            width: 122,
            height: 40,
            fit: BoxFit.cover,
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'Beta ',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 10, 0),
                  child: Text(
                    'v0.179',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    constraints: BoxConstraints(
                                      maxHeight: 800,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: wrapWithModel(
                                      model: _model.mainMenuModel,
                                      updateCallback: () => setState(() {}),
                                      child: MainMenuWidget(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Align(
                                alignment: AlignmentDirectional(0, -1),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.98,
                                            height: 800,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1, 0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await Clipboard.setData(ClipboardData(
                                                                            text:
                                                                                _model.promptFieldController.text));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Copy',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            20,
                                                                            5),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await Clipboard.setData(ClipboardData(
                                                                        text: _model
                                                                            .promptFieldController
                                                                            .text));
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .copy,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    size: 22,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Form(
                                                  key: _model.formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if (_model
                                                                  .dropDownValue !=
                                                              'Summarize')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          10),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .promptFieldController,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelText:
                                                                      'Prompt goes here...',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiaryColor,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width: 2,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      fontSize:
                                                                          18,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                                maxLines: 30,
                                                                minLines: 30,
                                                                validator: _model
                                                                    .promptFieldControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          if (_model
                                                                  .dropDownValue ==
                                                              'Summarize')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          10),
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 652,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    'Select one or multiple Datasets and create a full summary or its contents.',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.totalCredits,
                                                                          0.0) >=
                                                                      1.0)
                                                                    AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Stack(
                                                                        children: [
                                                                          if (_model.dropDownValue ==
                                                                              'My Data + GPT')
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1, -1),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().setQid = random_data.randomString(
                                                                                        7,
                                                                                        7,
                                                                                        true,
                                                                                        true,
                                                                                        true,
                                                                                      );
                                                                                      FFAppState().setEngine = _model.dropDownValue!;
                                                                                    });
                                                                                    await Future.delayed(const Duration(milliseconds: 500));

                                                                                    final userPromptsCreateData = createUserPromptsRecordData(
                                                                                      qid: FFAppState().setQid,
                                                                                      prompt: _model.promptFieldController.text,
                                                                                    );
                                                                                    var userPromptsRecordReference = UserPromptsRecord.createDoc(currentUserReference!);
                                                                                    await userPromptsRecordReference.set(userPromptsCreateData);
                                                                                    _model.setPrompt = UserPromptsRecord.getDocumentFromData(userPromptsCreateData, userPromptsRecordReference);
                                                                                    setState(() {
                                                                                      _model.promptFieldController?.clear();
                                                                                    });

                                                                                    context.pushNamed('retreivingMIX');

                                                                                    setState(() {});
                                                                                  },
                                                                                  text: 'OMP!',
                                                                                  options: FFButtonOptions(
                                                                                    width: 130,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                          color: Colors.white,
                                                                                          fontSize: 20,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                        ),
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (_model.dropDownValue ==
                                                                              'Summarize')
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1, -1),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().setQid = random_data.randomString(
                                                                                        7,
                                                                                        7,
                                                                                        true,
                                                                                        true,
                                                                                        true,
                                                                                      );
                                                                                      FFAppState().setEngine = _model.dropDownValue!;
                                                                                    });
                                                                                    await Future.delayed(const Duration(milliseconds: 500));

                                                                                    final userPromptsCreateData = createUserPromptsRecordData(
                                                                                      qid: FFAppState().setQid,
                                                                                      prompt: _model.promptFieldController.text,
                                                                                    );
                                                                                    var userPromptsRecordReference = UserPromptsRecord.createDoc(currentUserReference!);
                                                                                    await userPromptsRecordReference.set(userPromptsCreateData);
                                                                                    _model.setPromptSummarize = UserPromptsRecord.getDocumentFromData(userPromptsCreateData, userPromptsRecordReference);
                                                                                    setState(() {
                                                                                      _model.promptFieldController?.clear();
                                                                                    });

                                                                                    context.pushNamed('retreivingSummarize');

                                                                                    setState(() {});
                                                                                  },
                                                                                  text: 'OMP!',
                                                                                  options: FFButtonOptions(
                                                                                    width: 130,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                          color: Colors.white,
                                                                                          fontSize: 20,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                        ),
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (_model.dropDownValue ==
                                                                              'GPT Only')
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1, -1),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().setQid = random_data.randomString(
                                                                                        7,
                                                                                        7,
                                                                                        true,
                                                                                        true,
                                                                                        true,
                                                                                      );
                                                                                      FFAppState().setEngine = _model.dropDownValue!;
                                                                                    });
                                                                                    await Future.delayed(const Duration(milliseconds: 500));

                                                                                    final userPromptsCreateData = createUserPromptsRecordData(
                                                                                      qid: FFAppState().setQid,
                                                                                      prompt: _model.promptFieldController.text,
                                                                                    );
                                                                                    var userPromptsRecordReference = UserPromptsRecord.createDoc(currentUserReference!);
                                                                                    await userPromptsRecordReference.set(userPromptsCreateData);
                                                                                    _model.setPromptGPT = UserPromptsRecord.getDocumentFromData(userPromptsCreateData, userPromptsRecordReference);
                                                                                    setState(() {
                                                                                      _model.promptFieldController?.clear();
                                                                                    });

                                                                                    context.pushNamed('retreivingGPT');

                                                                                    setState(() {});
                                                                                  },
                                                                                  text: 'OMP!',
                                                                                  options: FFButtonOptions(
                                                                                    width: 130,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                          color: Colors.white,
                                                                                          fontSize: 20,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                        ),
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if ((valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.totalCredits,
                                                                              0.0) <=
                                                                          1.0) ||
                                                                      (valueOrDefault(
                                                                              currentUserDocument?.totalCredits,
                                                                              0.0) ==
                                                                          null))
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1,
                                                                              -1),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 700,
                                                                                      child: PaymentWidget(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            text:
                                                                                'OMP!',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 130,
                                                                              height: 40,
                                                                              color: FlutterFlowTheme.of(context).secondaryColor,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    color: Colors.white,
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                    child: Text(
                                                                      'Select Chain:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              20,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child: FlutterFlowDropDown<
                                                                          String>(
                                                                        initialOption:
                                                                            _model.dropDownValue ??=
                                                                                'My Data + GPT',
                                                                        options: [
                                                                          'My Data + GPT',
                                                                          'GPT Only',
                                                                          'Summarize'
                                                                        ],
                                                                        onChanged:
                                                                            (val) =>
                                                                                setState(() => _model.dropDownValue = val),
                                                                        width:
                                                                            280,
                                                                        height:
                                                                            50,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: Colors.black,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                        hintText:
                                                                            'Select Prompt Target...',
                                                                        fillColor:
                                                                            Colors.white,
                                                                        elevation:
                                                                            2,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderWidth:
                                                                            1,
                                                                        borderRadius:
                                                                            0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            4,
                                                                            12,
                                                                            4),
                                                                        hidesUnderline:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20,
                                                                            18,
                                                                            0,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                600,
                                                                            child:
                                                                                PromptConfigWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .settings_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiaryColor,
                                                                    size: 36,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.totalCredits,
                                                                  0.0) <=
                                                              0.0)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          25,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                700,
                                                                            child:
                                                                                PaymentWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 120,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Visibility(
                                                                      visible:
                                                                          responsiveVisibility(
                                                                        context:
                                                                            context,
                                                                        phone:
                                                                            false,
                                                                        tablet:
                                                                            false,
                                                                        tabletLandscape:
                                                                            false,
                                                                        desktop:
                                                                            false,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            '0 credits.',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'Buy credits now!',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0, -1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 10, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.98,
                                          height: 800,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x33000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                          ),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 5),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10,
                                                                      10,
                                                                      0,
                                                                      10),
                                                          child: Text(
                                                            'Datasets',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
                                                                              padding: MediaQuery.of(context).viewInsets,
                                                                              child: Container(
                                                                                height: 400,
                                                                                child: AddDatasetWidget(),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .create_new_folder_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiaryColor,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (FFAppState()
                                                                          .selectedDataset
                                                                          .length >=
                                                                      1)
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1,
                                                                            0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              FFAppState().update(() {
                                                                                FFAppState().selectedDataset = [];
                                                                              });

                                                                              context.pushNamed('Home');
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Clear',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                    color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                    fontSize: 11,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 780,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 10, 0),
                                                    child: StreamBuilder<
                                                        List<
                                                            UserDatasetsRecord>>(
                                                      stream:
                                                          queryUserDatasetsRecord(
                                                        parent:
                                                            currentUserReference,
                                                        queryBuilder:
                                                            (userDatasetsRecord) =>
                                                                userDatasetsRecord
                                                                    .orderBy(
                                                                        'dataset_name'),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 50,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UserDatasetsRecord>
                                                            listViewUserDatasetsRecordList =
                                                            snapshot.data!;
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewUserDatasetsRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewUserDatasetsRecord =
                                                                listViewUserDatasetsRecordList[
                                                                    listViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 2,
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  height: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                child: Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(0),
                                                                                      ),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).secondaryColor,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxValueMap[listViewUserDatasetsRecord] ??= FFAppState().selectedDataset.contains(listViewUserDatasetsRecord.datasetId),
                                                                                    onChanged: (newValue) async {
                                                                                      setState(() => _model.checkboxValueMap[listViewUserDatasetsRecord] = newValue!);
                                                                                      if (newValue!) {
                                                                                        setState(() {
                                                                                          FFAppState().addToSelectedDataset(listViewUserDatasetsRecord.datasetId!);
                                                                                        });
                                                                                      } else {
                                                                                        setState(() {
                                                                                          FFAppState().removeFromSelectedDataset(listViewUserDatasetsRecord.datasetId!);
                                                                                        });
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Expanded(
                                                                        flex: 7,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    child: InkWell(
                                                                                      onTap: () async {
                                                                                        FFAppState().activeDataset = listViewUserDatasetsRecord.reference;

                                                                                        context.pushNamed(
                                                                                          'Datasets',
                                                                                          queryParams: {
                                                                                            'activeDataset': serializeParam(
                                                                                              listViewUserDatasetsRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'activeDataset': listViewUserDatasetsRecord,
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: AutoSizeText(
                                                                                        listViewUserDatasetsRecord.datasetName!,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    FFAppState().activeDataset = listViewUserDatasetsRecord.reference;

                                                                                    context.pushNamed(
                                                                                      'Datasets',
                                                                                      queryParams: {
                                                                                        'activeDataset': serializeParam(
                                                                                          listViewUserDatasetsRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'activeDataset': listViewUserDatasetsRecord,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.settings_outlined,
                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    size: 24,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                if (responsiveVisibility(
                  context: context,
                  desktop: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 40, 10, 0),
                          child: Text(
                            'Only available on desktop for now. Mobile version coming soon!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
