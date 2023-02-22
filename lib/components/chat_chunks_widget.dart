import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  widget.chatDoc!.datasetNames!.toList().first,
                  style: FlutterFlowTheme.of(context).bodyText1,
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
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
