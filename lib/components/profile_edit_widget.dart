import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileEditWidget extends StatefulWidget {
  const ProfileEditWidget({Key? key}) : super(key: key);

  @override
  _ProfileEditWidgetState createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? industryController;
  TextEditingController? roleController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    industryController = TextEditingController();
    roleController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    industryController?.dispose();
    roleController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFDBE2E7),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 90,
                            height: 90,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              currentUserPhoto,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia = await selectMedia(
                          mediaSource: MediaSource.photoGallery,
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => isMediaUploading = true);
                          var downloadUrls = <String>[];
                          try {
                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            isMediaUploading = false;
                          }
                          if (downloadUrls.length == selectedMedia.length) {
                            setState(
                                () => uploadedFileUrl = downloadUrls.first);
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        final usersUpdateData = createUsersRecordData(
                          photoUrl: uploadedFileUrl,
                        );
                        await currentUserReference!.update(usersUpdateData);
                      },
                      text: 'Change Photo',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                        elevation: 1,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: firstNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: FlutterFlowTheme.of(context).bodyText2,
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: lastNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: FlutterFlowTheme.of(context).bodyText2,
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: industryController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Industry',
                    labelStyle: FlutterFlowTheme.of(context).bodyText2,
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                child: TextFormField(
                  controller: roleController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Role / Title',
                    labelStyle: FlutterFlowTheme.of(context).bodyText2,
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  maxLines: null,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final usersUpdateData = createUsersRecordData(
                        firstName: firstNameController!.text,
                        lastName: lastNameController!.text,
                        industry: industryController!.text,
                        role: roleController!.text,
                      );
                      await currentUserReference!.update(usersUpdateData);
                      setState(() {
                        firstNameController?.clear();
                        lastNameController?.clear();
                        industryController?.clear();
                        roleController?.clear();
                      });
                      await Future.delayed(const Duration(milliseconds: 500));
                      FFAppState().update(() {
                        FFAppState().firstLogin = false;
                      });
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(context);
                    },
                    text: 'Save Changes',
                    options: FFButtonOptions(
                      width: 160,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
