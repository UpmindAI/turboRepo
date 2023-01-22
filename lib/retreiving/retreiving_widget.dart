import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RetreivingWidget extends StatefulWidget {
  const RetreivingWidget({Key? key}) : super(key: key);

  @override
  _RetreivingWidgetState createState() => _RetreivingWidgetState();
}

class _RetreivingWidgetState extends State<RetreivingWidget> {
  ApiCallResponse? apiResultGPT;
  ApiCallResponse? apiResultPC;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().setEngine == 'GPT-3') {
        apiResultGPT = await PromptsGroup.gptCall.call(
          qid: FFAppState().setQid,
          idToken: currentJwtToken,
        );
      } else {
        if (FFAppState().setEngine == 'Pinecone') {
          apiResultPC = await PromptsGroup.pineconeCall.call(
            qid: FFAppState().setQid,
            datasetIdsList: FFAppState().selectedDataset,
            topK: FFAppState().setTopk,
            idToken: currentJwtToken,
          );
          if ((apiResultPC?.succeeded ?? true)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (apiResultPC?.statusCode ?? 200).toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Color(0x00000000),
              ),
            );

            context.pushNamed('Result');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (apiResultPC?.statusCode ?? 200).toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Color(0x00000000),
              ),
            );
            context.pop();
          }
        } else {
          context.pop();
        }

        return;
      }

      if ((apiResultGPT?.succeeded ?? true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (apiResultGPT?.statusCode ?? 200).toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        );

        context.pushNamed('Result');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              (apiResultGPT?.statusCode ?? 200).toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        );
        context.pop();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
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
        preferredSize: Size.fromHeight(60),
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: Text(
                        'Retrieving Results from Datasets:',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final selectedDatasets =
                            FFAppState().selectedDataset.map((e) => e).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: selectedDatasets.length,
                          itemBuilder: (context, selectedDatasetsIndex) {
                            final selectedDatasetsItem =
                                selectedDatasets[selectedDatasetsIndex];
                            return Text(
                              selectedDatasetsItem,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'Using engine:',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Text(
                      FFAppState().setEngine,
                      style: FlutterFlowTheme.of(context).bodyText1,
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
