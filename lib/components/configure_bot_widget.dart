import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'configure_bot_model.dart';
export 'configure_bot_model.dart';

class ConfigureBotWidget extends StatefulWidget {
  const ConfigureBotWidget({Key? key}) : super(key: key);

  @override
  _ConfigureBotWidgetState createState() => _ConfigureBotWidgetState();
}

class _ConfigureBotWidgetState extends State<ConfigureBotWidget> {
  late ConfigureBotModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfigureBotModel());

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
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            constraints: BoxConstraints(
              maxWidth: 800.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    'Configure your Chatbot',
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    'Top K',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Text(
                  formatNumber(
                    FFAppState().setTopK,
                    formatType: FormatType.custom,
                    format: '##',
                    locale: '',
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    inactiveColor: Color(0xFF9E9E9E),
                    min: 1.0,
                    max: 10.0,
                    value: _model.sliderValue ??= FFAppState().setTopK,
                    divisions: 9,
                    onChanged: (newValue) async {
                      newValue = double.parse(newValue.toStringAsFixed(4));
                      setState(() => _model.sliderValue = newValue);
                      setState(() {
                        FFAppState().setTopK = _model.sliderValue!;
                      });
                    },
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
