import '../components/add_dataset_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_dataset_button_model.dart';
export 'new_dataset_button_model.dart';

class NewDatasetButtonWidget extends StatefulWidget {
  const NewDatasetButtonWidget({Key? key}) : super(key: key);

  @override
  _NewDatasetButtonWidgetState createState() => _NewDatasetButtonWidgetState();
}

class _NewDatasetButtonWidgetState extends State<NewDatasetButtonWidget> {
  late NewDatasetButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewDatasetButtonModel());

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

    return Container(
      width: MediaQuery.of(context).size.width * 4,
      height: MediaQuery.of(context).size.height * 4,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: Text(
              'No Datasets yet.',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: 400,
                      child: AddDatasetWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            text: 'Add a new Dataset',
            icon: Icon(
              Icons.add_circle_outline,
              size: 15,
            ),
            options: FFButtonOptions(
              width: 250,
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
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
