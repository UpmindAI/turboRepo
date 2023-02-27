import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_chunks_model.dart';
export 'chat_chunks_model.dart';

class ChatChunksWidget extends StatefulWidget {
  const ChatChunksWidget({
    Key? key,
    this.chatDoc,
  }) : super(key: key);

  final ChatsRecord? chatDoc;

  @override
  _ChatChunksWidgetState createState() => _ChatChunksWidgetState();
}

class _ChatChunksWidgetState extends State<ChatChunksWidget> {
  late ChatChunksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatChunksModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              constraints: BoxConstraints(
                maxWidth: 1140,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        widget.chatDoc!.datasetNames!.toList().first,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        widget.chatDoc!.docTitles!.toList().first,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Text(
                      widget.chatDoc!.chunks!.toList().first,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              constraints: BoxConstraints(
                maxWidth: 1140,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        widget.chatDoc!.datasetNames!.toList()[1],
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        widget.chatDoc!.docTitles!.toList()[1],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Text(
                      widget.chatDoc!.chunks!.toList()[1],
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              constraints: BoxConstraints(
                maxWidth: 1140,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        widget.chatDoc!.datasetNames!.toList()[2],
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        widget.chatDoc!.docTitles!.toList()[2],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Text(
                      widget.chatDoc!.chunks!.toList()[2],
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              constraints: BoxConstraints(
                maxWidth: 1140,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        widget.chatDoc!.datasetNames!.toList()[3],
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        widget.chatDoc!.docTitles!.toList()[3],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Text(
                      widget.chatDoc!.chunks!.toList()[3],
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              constraints: BoxConstraints(
                maxWidth: 1140,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        widget.chatDoc!.datasetNames!.toList()[4],
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Text(
                        widget.chatDoc!.docTitles!.toList()[4],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Text(
                      widget.chatDoc!.chunks!.toList()[4],
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
