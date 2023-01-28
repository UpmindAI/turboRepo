import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PromptConfigWidget extends StatefulWidget {
  const PromptConfigWidget({Key? key}) : super(key: key);

  @override
  _PromptConfigWidgetState createState() => _PromptConfigWidgetState();
}

class _PromptConfigWidgetState extends State<PromptConfigWidget> {
  double? topKValue;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 600,
      height: 600,
      constraints: BoxConstraints(
        maxWidth: 600,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 260,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Top K',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  topKValue,
                                  formatType: FormatType.custom,
                                  format: '#',
                                  locale: '',
                                ),
                                '1',
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      inactiveColor: Color(0xFF9E9E9E),
                      min: 1,
                      max: 100,
                      value: topKValue ??= FFAppState().setTopK,
                      label: topKValue.toString(),
                      divisions: 99,
                      onChanged: (newValue) async {
                        newValue = double.parse(newValue.toStringAsFixed(0));
                        setState(() => topKValue = newValue);
                        FFAppState().setTopK = topKValue!;
                      },
                    ),
                  ],
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                FFAppState().update(() {
                  FFAppState().setTopK = topKValue!;
                });
                await Future.delayed(const Duration(milliseconds: 500));
                Navigator.pop(context);
              },
              text: 'Save',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                      color: Colors.white,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).subtitle2Family),
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
