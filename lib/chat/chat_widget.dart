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
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.promptStartController ??=
        TextEditingController(text: 'Start a Chat');
    _model.promptSendController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
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
          actions: [],
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
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
                          wrapWithModel(
                            model: _model.mainMenuModel,
                            updateCallback: () => setState(() {}),
                            child: MainMenuWidget(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.98,
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          5,
                                                                          10,
                                                                          5),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
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
                                                                              MediaQuery.of(context).size.height * 0.8,
                                                                          child:
                                                                              ConfigureBotWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                text:
                                                                    'Configure',
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .robot,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  size: 18,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 130,
                                                                  height: 30,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).subtitle2Family,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        5,
                                                                        10,
                                                                        5),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.8,
                                                                        child:
                                                                            ChatHistoryWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              text:
                                                                  'Chat History',
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .clock,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                size: 18,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130,
                                                                height: 30,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle2Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).subtitle2Family),
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        5,
                                                                        20,
                                                                        5),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .setCid = '';
                                                                });
                                                              },
                                                              text: 'Clear',
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                size: 18,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130,
                                                                height: 30,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle2Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryColor,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).subtitle2Family),
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(10, 20,
                                                                  10, 10),
                                                      child: StreamBuilder<
                                                          List<ChatsRecord>>(
                                                        stream:
                                                            queryChatsRecord(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder: (chatsRecord) =>
                                                              chatsRecord
                                                                  .where(
                                                                      'cid',
                                                                      isEqualTo:
                                                                          FFAppState()
                                                                              .setCid)
                                                                  .orderBy(
                                                                      'timestamp'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          List<ChatsRecord>
                                                              listViewChatsRecordList =
                                                              snapshot.data!;
                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewChatsRecordList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewChatsRecord =
                                                                  listViewChatsRecordList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child: Stack(
                                                                  children: [
                                                                    if (!listViewChatsRecord
                                                                        .isCompletion!)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    child: Text(
                                                                                      'You:',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                                                                                    child: Text(
                                                                                      listViewChatsRecord.prompt!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                    child: Text(
                                                                                      dateTimeFormat('relative', listViewChatsRecord.timestamp!),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 10,
                                                                                            fontWeight: FontWeight.w300,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    if (listViewChatsRecord
                                                                            .isCompletion ??
                                                                        true)
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1, 0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(40, 20, 0, 0),
                                                                                    child: Text(
                                                                                      'Completion:',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1, 0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(40, 5, 10, 5),
                                                                                    child: Text(
                                                                                      listViewChatsRecord.completion!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(1, 0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                          child: Text(
                                                                                            dateTimeFormat('relative', listViewChatsRecord.timestamp!),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                  fontSize: 10,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                      child: Icon(
                                                                                        Icons.search,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 14,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                      child: InkWell(
                                                                                        onTap: () async {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return Padding(
                                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                                child: Container(
                                                                                                  height: MediaQuery.of(context).size.height * 0.8,
                                                                                                  child: ChatChunksWidget(
                                                                                                    chatDoc: listViewChatsRecord,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => setState(() {}));
                                                                                        },
                                                                                        child: Text(
                                                                                          'Sources',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  if (FFAppState().setCid ==
                                                          null ||
                                                      FFAppState().setCid == '')
                                                    Form(
                                                      key: _model.formKey1,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    20, 0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .promptStartController,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            FFAppState()
                                                                    .setCid =
                                                                random_data
                                                                    .randomString(
                                                              9,
                                                              9,
                                                              true,
                                                              true,
                                                              true,
                                                            );

                                                            final chatMetaCreateData =
                                                                createChatMetaRecordData(
                                                              createdOn:
                                                                  getCurrentTimestamp,
                                                              cid: FFAppState()
                                                                  .setCid,
                                                              firstMessage: _model
                                                                  .promptSendController
                                                                  .text,
                                                            );
                                                            var chatMetaRecordReference =
                                                                ChatMetaRecord
                                                                    .createDoc(
                                                                        currentUserReference!);
                                                            await chatMetaRecordReference
                                                                .set(
                                                                    chatMetaCreateData);
                                                            _model.createChatForm =
                                                                ChatMetaRecord
                                                                    .getDocumentFromData(
                                                                        chatMetaCreateData,
                                                                        chatMetaRecordReference);

                                                            final chatsCreateData =
                                                                {
                                                              ...createChatsRecordData(
                                                                cid:
                                                                    FFAppState()
                                                                        .setCid,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                isCompletion:
                                                                    false,
                                                                qid: random_data
                                                                    .randomString(
                                                                  11,
                                                                  11,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                ),
                                                                prompt: _model
                                                                    .promptSendController
                                                                    .text,
                                                              ),
                                                              'dataset_ids': _model
                                                                  .checkboxCheckedItems
                                                                  .map((e) => e
                                                                      .datasetId)
                                                                  .withoutNulls
                                                                  .toList(),
                                                            };
                                                            var chatsRecordReference =
                                                                ChatsRecord
                                                                    .createDoc(
                                                                        currentUserReference!);
                                                            await chatsRecordReference
                                                                .set(
                                                                    chatsCreateData);
                                                            _model.createMessageForm =
                                                                ChatsRecord.getDocumentFromData(
                                                                    chatsCreateData,
                                                                    chatsRecordReference);
                                                            setState(() {
                                                              _model
                                                                  .promptSendController
                                                                  ?.clear();
                                                            });
                                                            _model.apiResultStartForm =
                                                                await ChatServerCall
                                                                    .call(
                                                              idToken:
                                                                  currentJwtToken,
                                                              qid: _model
                                                                  .createMessage!
                                                                  .qid,
                                                              cid: FFAppState()
                                                                  .setCid,
                                                              datasetIdsList:
                                                                  FFAppState()
                                                                      .selectedDataset,
                                                              topK: FFAppState()
                                                                  .setTopK,
                                                            );

                                                            setState(() {});
                                                          },
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFF980000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFF980000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                          validator: _model
                                                              .promptStartControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  if (FFAppState().setCid !=
                                                          null &&
                                                      FFAppState().setCid != '')
                                                    Form(
                                                      key: _model.formKey2,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    20, 0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .promptSendController,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            final chatsCreateData =
                                                                {
                                                              ...createChatsRecordData(
                                                                cid:
                                                                    FFAppState()
                                                                        .setCid,
                                                                timestamp:
                                                                    getCurrentTimestamp,
                                                                isCompletion:
                                                                    false,
                                                                qid: random_data
                                                                    .randomString(
                                                                  11,
                                                                  11,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                ),
                                                                prompt: _model
                                                                    .promptSendController
                                                                    .text,
                                                              ),
                                                              'dataset_ids': _model
                                                                  .checkboxCheckedItems
                                                                  .map((e) => e
                                                                      .datasetId)
                                                                  .withoutNulls
                                                                  .toList(),
                                                            };
                                                            var chatsRecordReference =
                                                                ChatsRecord
                                                                    .createDoc(
                                                                        currentUserReference!);
                                                            await chatsRecordReference
                                                                .set(
                                                                    chatsCreateData);
                                                            _model.chatMessageNewFromField =
                                                                ChatsRecord.getDocumentFromData(
                                                                    chatsCreateData,
                                                                    chatsRecordReference);
                                                            setState(() {
                                                              _model
                                                                  .promptSendController
                                                                  ?.clear();
                                                              _model
                                                                  .promptStartController
                                                                  ?.clear();
                                                            });
                                                            _model.apiResultzymFF =
                                                                await ChatServerCall
                                                                    .call(
                                                              idToken:
                                                                  currentJwtToken,
                                                              qid: _model
                                                                  .chatMessageNew!
                                                                  .qid,
                                                              cid: FFAppState()
                                                                  .setCid,
                                                              datasetIdsList:
                                                                  FFAppState()
                                                                      .selectedDataset,
                                                              topK: FFAppState()
                                                                  .setTopK,
                                                            );

                                                            setState(() {});
                                                          },
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Continue your chat...',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFF980000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFF980000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.0),
                                                              ),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                          validator: _model
                                                              .promptSendControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                if (FFAppState().setCid ==
                                                        null ||
                                                    FFAppState().setCid == '')
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      FFAppState().setCid =
                                                          random_data
                                                              .randomString(
                                                        9,
                                                        9,
                                                        true,
                                                        true,
                                                        true,
                                                      );

                                                      final chatMetaCreateData =
                                                          createChatMetaRecordData(
                                                        createdOn:
                                                            getCurrentTimestamp,
                                                        cid:
                                                            FFAppState().setCid,
                                                        firstMessage: _model
                                                            .promptStartController
                                                            .text,
                                                      );
                                                      var chatMetaRecordReference =
                                                          ChatMetaRecord.createDoc(
                                                              currentUserReference!);
                                                      await chatMetaRecordReference
                                                          .set(
                                                              chatMetaCreateData);
                                                      _model.createChat = ChatMetaRecord
                                                          .getDocumentFromData(
                                                              chatMetaCreateData,
                                                              chatMetaRecordReference);

                                                      final chatsCreateData = {
                                                        ...createChatsRecordData(
                                                          cid: FFAppState()
                                                              .setCid,
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                          isCompletion: false,
                                                          qid: random_data
                                                              .randomString(
                                                            11,
                                                            11,
                                                            true,
                                                            true,
                                                            true,
                                                          ),
                                                          prompt: _model
                                                              .promptStartController
                                                              .text,
                                                        ),
                                                        'dataset_ids': _model
                                                            .checkboxCheckedItems
                                                            .map((e) =>
                                                                e.datasetId)
                                                            .withoutNulls
                                                            .toList(),
                                                      };
                                                      var chatsRecordReference =
                                                          ChatsRecord.createDoc(
                                                              currentUserReference!);
                                                      await chatsRecordReference
                                                          .set(chatsCreateData);
                                                      _model.createMessage = ChatsRecord
                                                          .getDocumentFromData(
                                                              chatsCreateData,
                                                              chatsRecordReference);
                                                      setState(() {
                                                        _model
                                                            .promptStartController
                                                            ?.clear();
                                                        _model
                                                            .promptSendController
                                                            ?.clear();
                                                      });
                                                      _model.apiResultStart =
                                                          await ChatServerCall
                                                              .call(
                                                        idToken:
                                                            currentJwtToken,
                                                        qid: _model
                                                            .createMessage!.qid,
                                                        cid:
                                                            FFAppState().setCid,
                                                        datasetIdsList:
                                                            FFAppState()
                                                                .selectedDataset,
                                                        topK: FFAppState()
                                                            .setTopK,
                                                      );

                                                      setState(() {});
                                                    },
                                                    text: 'Start',
                                                    icon: Icon(
                                                      Icons.send,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 45,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                  ),
                                                if (FFAppState().setCid !=
                                                        null &&
                                                    FFAppState().setCid != '')
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      final chatsCreateData = {
                                                        ...createChatsRecordData(
                                                          cid: FFAppState()
                                                              .setCid,
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                          isCompletion: false,
                                                          qid: random_data
                                                              .randomString(
                                                            11,
                                                            11,
                                                            true,
                                                            true,
                                                            true,
                                                          ),
                                                          prompt: _model
                                                              .promptStartController
                                                              .text,
                                                        ),
                                                        'dataset_ids': _model
                                                            .checkboxCheckedItems
                                                            .map((e) =>
                                                                e.datasetId)
                                                            .withoutNulls
                                                            .toList(),
                                                      };
                                                      var chatsRecordReference =
                                                          ChatsRecord.createDoc(
                                                              currentUserReference!);
                                                      await chatsRecordReference
                                                          .set(chatsCreateData);
                                                      _model.chatMessageNew = ChatsRecord
                                                          .getDocumentFromData(
                                                              chatsCreateData,
                                                              chatsRecordReference);
                                                      setState(() {
                                                        _model
                                                            .promptStartController
                                                            ?.clear();
                                                        _model
                                                            .promptSendController
                                                            ?.clear();
                                                      });
                                                      _model.apiResultzym =
                                                          await ChatServerCall
                                                              .call(
                                                        idToken:
                                                            currentJwtToken,
                                                        qid: _model
                                                            .chatMessageNew!
                                                            .qid,
                                                        cid:
                                                            FFAppState().setCid,
                                                        datasetIdsList:
                                                            FFAppState()
                                                                .selectedDataset,
                                                        topK: FFAppState()
                                                            .setTopK,
                                                      );

                                                      setState(() {});
                                                    },
                                                    text: 'Send',
                                                    icon: Icon(
                                                      Icons.send,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 45,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
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
                          ),
                        ],
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.98,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 0, 10),
                                                  child: Text(
                                                    'Datasets',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 0, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          400,
                                                                      child:
                                                                          AddDatasetWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .create_new_folder_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiaryColor,
                                                              size: 22,
                                                            ),
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .selectedDataset
                                                                .length >=
                                                            1)
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1, 0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .selectedDataset = [];
                                                                    });

                                                                    context.pushNamed(
                                                                        'Home');
                                                                  },
                                                                  child: Text(
                                                                    'Clear',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiaryColor,
                                                                          fontSize:
                                                                              11,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 780,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: StreamBuilder<
                                                List<UserDatasetsRecord>>(
                                              stream: queryUserDatasetsRecord(
                                                parent: currentUserReference,
                                                queryBuilder:
                                                    (userDatasetsRecord) =>
                                                        userDatasetsRecord
                                                            .orderBy(
                                                                'dataset_name'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewUserDatasetsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewUserDatasetsRecord =
                                                        listViewUserDatasetsRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2,
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                        child:
                                                                            Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(0),
                                                                              ),
                                                                            ),
                                                                            unselectedWidgetColor:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                          ),
                                                                          child:
                                                                              Checkbox(
                                                                            value: _model.checkboxValueMap[listViewUserDatasetsRecord] ??=
                                                                                FFAppState().selectedDataset.contains(listViewUserDatasetsRecord.datasetId),
                                                                            onChanged:
                                                                                (newValue) async {
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
                                                                            activeColor:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                flex: 7,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0, 0),
                                                                            child:
                                                                                InkWell(
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
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            FFAppState().activeDataset =
                                                                                listViewUserDatasetsRecord.reference;

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
                                                                          child:
                                                                              Icon(
                                                                            Icons.settings_outlined,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                24,
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
        ),
      ),
    );
  }
}
