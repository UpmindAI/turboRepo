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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.chatColumn?.animateTo(
        _model.chatColumn!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.startFieldMLController ??= TextEditingController();
    _model.sendFieldMLController ??= TextEditingController();
    _model.startFieldController ??= TextEditingController();
    _model.sendFieldController ??= TextEditingController();
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
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          elevation: 0.0,
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
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.98,
                                  height: 800.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 5.0, 10.0, 5.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.8,
                                                            child:
                                                                ConfigureBotWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  text: 'Configure',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.robot,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: 18.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 130.0,
                                                    height: 30.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryColor,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2Family),
                                                            ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 10.0, 5.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.8,
                                                          child:
                                                              ChatHistoryWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                text: 'Chat History',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.clock,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  size: 18.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 130.0,
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 20.0, 5.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  FFAppState().update(() {
                                                    FFAppState().setCid = '';
                                                    FFAppState().setChat = null;
                                                  });
                                                },
                                                text: 'Clear',
                                                icon: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  size: 18.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 130.0,
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                height: 750.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 20.0,
                                                          10.0, 10.0),
                                                  child: StreamBuilder<
                                                      List<ChatsRecord>>(
                                                    stream: queryChatsRecord(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder: (chatsRecord) =>
                                                          chatsRecord
                                                              .where('cid',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .setCid)
                                                              .orderBy(
                                                                  'timestamp'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ChatsRecord>
                                                          chatColumnChatsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        controller:
                                                            _model.chatColumn,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              chatColumnChatsRecordList
                                                                  .length,
                                                              (chatColumnIndex) {
                                                            final chatColumnChatsRecord =
                                                                chatColumnChatsRecordList[
                                                                    chatColumnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Stack(
                                                                children: [
                                                                  if (!chatColumnChatsRecord
                                                                      .isCompletion!)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
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
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                    child: Text(
                                                                                      chatColumnChatsRecord.prompt!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: InkWell(
                                                                                          onTap: () async {
                                                                                            await Clipboard.setData(ClipboardData(text: chatColumnChatsRecord.prompt!));
                                                                                          },
                                                                                          child: FaIcon(
                                                                                            FontAwesomeIcons.copy,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            size: 14.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat('relative', chatColumnChatsRecord.timestamp!),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                fontSize: 10.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (chatColumnChatsRecord
                                                                          .isCompletion ??
                                                                      true)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          40.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                      child:
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
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
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
                                                                                Stack(
                                                                                  children: [
                                                                                    if (chatColumnChatsRecord.isLoading ?? true)
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 10.0, 5.0),
                                                                                          child: Text(
                                                                                            'Typing...',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if (!chatColumnChatsRecord.isLoading!)
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 10.0, 5.0),
                                                                                          child: Text(
                                                                                            chatColumnChatsRecord.completion!,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat('relative', chatColumnChatsRecord.timestamp!),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                fontSize: 10.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.search,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 14.0,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
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
                                                                                                    chatDoc: chatColumnChatsRecord,
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
                                                                                    InkWell(
                                                                                      onTap: () async {
                                                                                        await Clipboard.setData(ClipboardData(text: chatColumnChatsRecord.completion!));
                                                                                      },
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.copy,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        size: 14.0,
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
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Stack(
                                                  children: [
                                                    if (_model.multiLine)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.multiLine =
                                                                  false;
                                                            });
                                                          },
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .gripLines,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    if (!_model.multiLine)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.multiLine =
                                                                  true;
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .format_line_spacing_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  if (_model.multiLine)
                                                    Stack(
                                                      children: [
                                                        if (FFAppState()
                                                                    .setCid ==
                                                                null ||
                                                            FFAppState()
                                                                    .setCid ==
                                                                '')
                                                          Form(
                                                            key:
                                                                _model.formKey1,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.startFieldMLController,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintText:
                                                                                'Start a Chat...',
                                                                            hintStyle:
                                                                                FlutterFlowTheme.of(context).bodyText2,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).tertiaryColor,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF980000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF980000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(4.0),
                                                                                topRight: Radius.circular(4.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                          maxLines:
                                                                              6,
                                                                          minLines:
                                                                              6,
                                                                          validator: _model
                                                                              .startFieldMLControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState().setCid =
                                                                              random_data.randomString(
                                                                            9,
                                                                            9,
                                                                            true,
                                                                            true,
                                                                            true,
                                                                          );
                                                                          // createMeta

                                                                          final chatMetaCreateData =
                                                                              {
                                                                            ...createChatMetaRecordData(
                                                                              createdOn: getCurrentTimestamp,
                                                                              cid: FFAppState().setCid,
                                                                              isLoading: true,
                                                                            ),
                                                                            'prompts':
                                                                                [
                                                                              _model.startFieldMLController.text
                                                                            ],
                                                                          };
                                                                          var chatMetaRecordReference =
                                                                              ChatMetaRecord.createDoc(currentUserReference!);
                                                                          await chatMetaRecordReference
                                                                              .set(chatMetaCreateData);
                                                                          _model.createChatFormML = ChatMetaRecord.getDocumentFromData(
                                                                              chatMetaCreateData,
                                                                              chatMetaRecordReference);
                                                                          setState(
                                                                              () {
                                                                            FFAppState().setChat =
                                                                                _model.createChatFormML!.reference;
                                                                          });

                                                                          final chatsCreateData =
                                                                              {
                                                                            ...createChatsRecordData(
                                                                              cid: FFAppState().setCid,
                                                                              timestamp: getCurrentTimestamp,
                                                                              isCompletion: false,
                                                                              qid: random_data.randomString(
                                                                                11,
                                                                                11,
                                                                                true,
                                                                                true,
                                                                                true,
                                                                              ),
                                                                              prompt: _model.startFieldMLController.text,
                                                                            ),
                                                                            'dataset_ids':
                                                                                _model.checkboxCheckedItems.map((e) => e.datasetId).withoutNulls.toList(),
                                                                          };
                                                                          var chatsRecordReference =
                                                                              ChatsRecord.createDoc(currentUserReference!);
                                                                          await chatsRecordReference
                                                                              .set(chatsCreateData);
                                                                          _model.createMessageFormML = ChatsRecord.getDocumentFromData(
                                                                              chatsCreateData,
                                                                              chatsRecordReference);
                                                                          setState(
                                                                              () {
                                                                            _model.startFieldMLController?.clear();
                                                                            _model.sendFieldMLController?.clear();
                                                                          });
                                                                          _model.apiResultStartFormML =
                                                                              await MixedChatCall.call(
                                                                            idToken:
                                                                                currentJwtToken,
                                                                            qid:
                                                                                _model.createMessageFormML!.qid,
                                                                            cid:
                                                                                FFAppState().setCid,
                                                                            datasetIdsList:
                                                                                FFAppState().selectedDataset,
                                                                            topK:
                                                                                FFAppState().setTopK,
                                                                          );

                                                                          context
                                                                              .pushNamed('Chat');

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Send',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                color: Colors.white,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                              ),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                                    .setCid !=
                                                                null &&
                                                            FFAppState()
                                                                    .setCid !=
                                                                '')
                                                          Form(
                                                            key:
                                                                _model.formKey2,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .sendFieldMLController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Continue your chat...',
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).bodyText2,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiaryColor,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF980000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF980000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(4.0),
                                                                            topRight:
                                                                                Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                      maxLines:
                                                                          6,
                                                                      minLines:
                                                                          6,
                                                                      validator: _model
                                                                          .sendFieldMLControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      // sendMessage

                                                                      final chatsCreateData =
                                                                          {
                                                                        ...createChatsRecordData(
                                                                          cid: FFAppState()
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
                                                                              .sendFieldMLController
                                                                              .text,
                                                                          message:
                                                                              '',
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
                                                                          .set(
                                                                              chatsCreateData);
                                                                      _model.chatMessageNewFromFieldML = ChatsRecord.getDocumentFromData(
                                                                          chatsCreateData,
                                                                          chatsRecordReference);

                                                                      final chatMetaUpdateData =
                                                                          {
                                                                        'prompts':
                                                                            FieldValue.arrayUnion([
                                                                          _model
                                                                              .sendFieldMLController
                                                                              .text
                                                                        ]),
                                                                      };
                                                                      await FFAppState()
                                                                          .setChat!
                                                                          .update(
                                                                              chatMetaUpdateData);
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .startFieldMLController
                                                                            ?.clear();
                                                                        _model
                                                                            .sendFieldMLController
                                                                            ?.clear();
                                                                      });
                                                                      await _model
                                                                          .chatColumn
                                                                          ?.animateTo(
                                                                        _model
                                                                            .chatColumn!
                                                                            .position
                                                                            .maxScrollExtent,
                                                                        duration:
                                                                            Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                      _model.apiResulchatML =
                                                                          await MixedChatCall
                                                                              .call(
                                                                        idToken:
                                                                            currentJwtToken,
                                                                        qid: _model
                                                                            .createMessageFormML!
                                                                            .qid,
                                                                        cid: FFAppState()
                                                                            .setCid,
                                                                        datasetIdsList:
                                                                            FFAppState().selectedDataset,
                                                                        topK: FFAppState()
                                                                            .setTopK,
                                                                      );
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                      await _model
                                                                          .chatColumn
                                                                          ?.animateTo(
                                                                        _model
                                                                            .chatColumn!
                                                                            .position
                                                                            .maxScrollExtent,
                                                                        duration:
                                                                            Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                      await _model
                                                                          .chatColumn
                                                                          ?.animateTo(
                                                                        _model
                                                                            .chatColumn!
                                                                            .position
                                                                            .maxScrollExtent,
                                                                        duration:
                                                                            Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              1000));
                                                                      await _model
                                                                          .chatColumn
                                                                          ?.animateTo(
                                                                        _model
                                                                            .chatColumn!
                                                                            .position
                                                                            .maxScrollExtent,
                                                                        duration:
                                                                            Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Send',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          60.0,
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).subtitle2Family,
                                                                            color:
                                                                                Colors.white,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                          ),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  if (!_model.multiLine)
                                                    Stack(
                                                      children: [
                                                        if (FFAppState()
                                                                    .setCid ==
                                                                null ||
                                                            FFAppState()
                                                                    .setCid ==
                                                                '')
                                                          Form(
                                                            key:
                                                                _model.formKey3,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .startFieldController,
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
                                                                // createMeta

                                                                final chatMetaCreateData =
                                                                    {
                                                                  ...createChatMetaRecordData(
                                                                    createdOn:
                                                                        getCurrentTimestamp,
                                                                    cid: FFAppState()
                                                                        .setCid,
                                                                    isLoading:
                                                                        true,
                                                                  ),
                                                                  'prompts': [
                                                                    _model
                                                                        .startFieldController
                                                                        .text
                                                                  ],
                                                                };
                                                                var chatMetaRecordReference =
                                                                    ChatMetaRecord
                                                                        .createDoc(
                                                                            currentUserReference!);
                                                                await chatMetaRecordReference
                                                                    .set(
                                                                        chatMetaCreateData);
                                                                _model.createChatForm =
                                                                    ChatMetaRecord.getDocumentFromData(
                                                                        chatMetaCreateData,
                                                                        chatMetaRecordReference);
                                                                setState(() {
                                                                  FFAppState()
                                                                          .setChat =
                                                                      _model
                                                                          .createChatForm!
                                                                          .reference;
                                                                });

                                                                final chatsCreateData =
                                                                    {
                                                                  ...createChatsRecordData(
                                                                    cid: FFAppState()
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
                                                                        .startFieldController
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
                                                                      .startFieldController
                                                                      ?.clear();
                                                                  _model
                                                                      .sendFieldController
                                                                      ?.clear();
                                                                });
                                                                _model.apiResultStartForm =
                                                                    await MixedChatCall
                                                                        .call(
                                                                  idToken:
                                                                      currentJwtToken,
                                                                  qid: _model
                                                                      .createMessageForm!
                                                                      .qid,
                                                                  cid: FFAppState()
                                                                      .setCid,
                                                                  datasetIdsList:
                                                                      FFAppState()
                                                                          .selectedDataset,
                                                                  topK: FFAppState()
                                                                      .setTopK,
                                                                );

                                                                context
                                                                    .pushNamed(
                                                                        'Chat');

                                                                setState(() {});
                                                              },
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Start a Chat...',
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
                                                                    width: 1.0,
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
                                                                    width: 1.0,
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
                                                                    width: 1.0,
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
                                                                    width: 1.0,
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
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons.send,
                                                                  color: Color(
                                                                      0xFF757575),
                                                                  size: 22.0,
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                              validator: _model
                                                                  .startFieldControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        if (FFAppState()
                                                                    .setCid !=
                                                                null &&
                                                            FFAppState()
                                                                    .setCid !=
                                                                '')
                                                          Form(
                                                            key:
                                                                _model.formKey4,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .sendFieldController,
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                // sendMessage

                                                                final chatsCreateData =
                                                                    {
                                                                  ...createChatsRecordData(
                                                                    cid: FFAppState()
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
                                                                        .sendFieldController
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

                                                                final chatMetaUpdateData =
                                                                    {
                                                                  'prompts':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    _model
                                                                        .sendFieldController
                                                                        .text
                                                                  ]),
                                                                };
                                                                await FFAppState()
                                                                    .setChat!
                                                                    .update(
                                                                        chatMetaUpdateData);
                                                                setState(() {
                                                                  _model
                                                                      .startFieldController
                                                                      ?.clear();
                                                                  _model
                                                                      .sendFieldController
                                                                      ?.clear();
                                                                });
                                                                await _model
                                                                    .chatColumn
                                                                    ?.animateTo(
                                                                  _model
                                                                      .chatColumn!
                                                                      .position
                                                                      .maxScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                _model.apiResultzymFF =
                                                                    await MixedChatCall
                                                                        .call(
                                                                  idToken:
                                                                      currentJwtToken,
                                                                  qid: _model
                                                                      .chatMessageNewFromField!
                                                                      .qid,
                                                                  cid: FFAppState()
                                                                      .setCid,
                                                                  datasetIdsList:
                                                                      FFAppState()
                                                                          .selectedDataset,
                                                                  topK: FFAppState()
                                                                      .setTopK,
                                                                );
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1000));
                                                                await _model
                                                                    .chatColumn
                                                                    ?.animateTo(
                                                                  _model
                                                                      .chatColumn!
                                                                      .position
                                                                      .maxScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1000));
                                                                await _model
                                                                    .chatColumn
                                                                    ?.animateTo(
                                                                  _model
                                                                      .chatColumn!
                                                                      .position
                                                                      .maxScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                                await Future.delayed(
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1000));
                                                                await _model
                                                                    .chatColumn
                                                                    ?.animateTo(
                                                                  _model
                                                                      .chatColumn!
                                                                      .position
                                                                      .maxScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .ease,
                                                                );

                                                                setState(() {});
                                                              },
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Continue your chat...',
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
                                                                    width: 1.0,
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
                                                                    width: 1.0,
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
                                                                    width: 1.0,
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
                                                                    width: 1.0,
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
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons.send,
                                                                  color: Color(
                                                                      0xFF757575),
                                                                  size: 22.0,
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                              validator: _model
                                                                  .sendFieldControllerValidator
                                                                  .asValidator(
                                                                      context),
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
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 10.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.98,
                                  height: 800.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    controller: _model.columnController,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0, 0.0,
                                                          10.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'Datasets');
                                                    },
                                                    child: Text(
                                                      'Datasets',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
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
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
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
                                                                          400.0,
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
                                                              size: 22.0,
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
                                                                      1.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
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
                                                                              11.0,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: 780.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
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
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 50.0,
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 40.0,
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
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Theme(
                                                                          data:
                                                                              ThemeData(
                                                                            checkboxTheme:
                                                                                CheckboxThemeData(
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(0.0),
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
                                                                                AlignmentDirectional(0.0, 0.0),
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
                                                                                      fontSize: 14.0,
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
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
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
                                                                                24.0,
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
                                                  controller:
                                                      _model.listViewController,
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
