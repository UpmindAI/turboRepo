import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TermsServiceWidget extends StatefulWidget {
  const TermsServiceWidget({Key? key}) : super(key: key);

  @override
  _TermsServiceWidgetState createState() => _TermsServiceWidgetState();
}

class _TermsServiceWidgetState extends State<TermsServiceWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 800,
      height: 800,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                child: Text(
                  'Terms of Service',
                  style: FlutterFlowTheme.of(context).title1,
                ),
              ),
              Text(
                'These Terms of Service govern your use of the website located at https://omp.ohmyprompt.com and https://ohmyprompt.com and any related services provided by OMP!.\nBy accessing https://omp.ohmyprompt.com and https://ohmyprompt.com, you agree to abide by these Terms of Service and to comply with all applicable laws and regulations. If you do not agree with these Terms of Service, you are prohibited from using or accessing this website or using any other services provided by OMP!.\nWe, OMP!,reserve the right to review and amend any of these Terms of Service at our sole discretion. Upon doing so, we will update this page. Any changes to these Terms of Service will take effect immediately from the date of publication.\nThese Terms of Service were last updated on 9 January 2023.',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                child: Text(
                  'Limitations of Use',
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
              Text(
                '1. modify, copy, prepare derivative works of, decompile, or reverse engineer any materials and software contained on this website;\n2. remove any copyright or other proprietary notations from any materials and software on this website;\n3. transfer the materials to another person or “mirror” the materials on any other server;\n4. knowingly or negligently use this website or any of its associated services in a way that abuses or disrupts our networks or any other service OMP! provides;\n5. use this website or its associated services to transmit or publish any harassing, indecent, obscene, fraudulent, or unlawful material;\n6. use this website or its associated services in violation of any applicable laws or regulations;\n7. use this website in conjunction with sending unauthorized advertising or spam;\n8. harvest, collect or gather user data without the user’s consent; or\n9. use this website or its associated services in such a way that may infringe the privacy, intellectual property rights, or other rights of third parties.\n',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Text(
                  'Intellectual Property',
                  style: FlutterFlowTheme.of(context).title3,
                ),
              ),
              Text(
                'The intellectual property in the materials contained in this website are owned by or licensed to OMP! and are protected by applicable copyright and trademark law. We grant our users permission to download one copy of the materials for personal, non-commercial transitory use.\nThis constitutes the grant of a license, not a transfer of title. This license shall automatically terminate if you violate any of these restrictions or the Terms of Service, and may be terminated by OMP! at any time.\n',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
