import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Text(
            'Configure your Chatbot',
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ),
      ],
    );
  }
}
