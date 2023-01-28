import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadConfigWidget extends StatefulWidget {
  const UploadConfigWidget({Key? key}) : super(key: key);

  @override
  _UploadConfigWidgetState createState() => _UploadConfigWidgetState();
}

class _UploadConfigWidgetState extends State<UploadConfigWidget> {
  double? sliderValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'Chunk Size',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        valueOrDefault<String>(
                          formatNumber(
                            sliderValue,
                            formatType: FormatType.custom,
                            format: '##',
                            locale: '',
                          ),
                          '##',
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Slider(
            activeColor: FlutterFlowTheme.of(context).primaryColor,
            inactiveColor: Color(0xFF9E9E9E),
            min: 0,
            max: 10,
            value: sliderValue ??= FFAppState().setChunkSize,
            label: sliderValue.toString(),
            divisions: 10,
            onChanged: (newValue) {
              newValue = double.parse(newValue.toStringAsFixed(0));
              setState(() => sliderValue = newValue);
            },
          ),
          FFButtonWidget(
            onPressed: () async {
              FFAppState().update(() {
                FFAppState().setChunkSize = sliderValue!;
              });
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
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ],
      ),
    );
  }
}
