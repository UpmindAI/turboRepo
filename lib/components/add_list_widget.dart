import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_list_model.dart';
export 'add_list_model.dart';

class AddListWidget extends StatefulWidget {
  const AddListWidget({
    Key? key,
    this.setDataset,
  }) : super(key: key);

  final UserDatasetsRecord? setDataset;

  @override
  _AddListWidgetState createState() => _AddListWidgetState();
}

class _AddListWidgetState extends State<AddListWidget> {
  late AddListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddListModel());

    _model.urlListFieldController ??= TextEditingController();
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              maxWidth: 780,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: TextFormField(
                    controller: _model.urlListFieldController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Add a list of URLs.',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    maxLines: 34,
                    minLines: 34,
                    validator: _model.urlListFieldControllerValidator
                        .asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.scrapeAPIresult = await ScrapeServerCall.call(
                        sourceUrl: _model.urlListFieldController.text,
                        idToken: currentJwtToken,
                        datasetId: widget.setDataset!.datasetId,
                        datasetName: widget.setDataset!.datasetName,
                      );
                      if ((_model.scrapeAPIresult?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Your URL was added as a source and is being processed.',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0x00000000),
                          ),
                        );
                        setState(() {
                          _model.urlListFieldController?.clear();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              (_model.scrapeAPIresult?.statusCode ?? 200)
                                  .toString(),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0x00000000),
                          ),
                        );
                      }

                      setState(() {});
                    },
                    text: 'Send',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
