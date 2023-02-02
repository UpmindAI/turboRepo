import '../auth/auth_util.dart';
import '../backend/stripe/payment_manager.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  String? paymentId;
  double? sliderValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 700,
        height: 700,
        constraints: BoxConstraints(
          maxWidth: 700,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Text(
                'Buy Credits',
                style: FlutterFlowTheme.of(context).title3,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Text(
                'One USD  =  10 credits',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
            Text(
              '${valueOrDefault<String>(
                formatNumber(
                  sliderValue,
                  formatType: FormatType.custom,
                  format: '##',
                  locale: '',
                ),
                '##',
              )}0 credits',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Slider(
              activeColor: FlutterFlowTheme.of(context).primaryColor,
              inactiveColor: Color(0xFF9E9E9E),
              min: 5,
              max: 100,
              value: sliderValue ??= 5,
              onChanged: (newValue) {
                newValue = double.parse(newValue.toStringAsFixed(4));
                setState(() => sliderValue = newValue);
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Text(
                'Total:  \$${formatNumber(
                  sliderValue,
                  formatType: FormatType.custom,
                  format: '##',
                  locale: '',
                )}',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                final paymentResponse = await processStripePayment(
                  context,
                  amount: functions.getPrice(sliderValue),
                  currency: 'USD',
                  customerEmail: currentUserEmail,
                  customerName: currentUserDisplayName,
                  description: currentUserUid,
                  allowGooglePay: false,
                  allowApplePay: false,
                );
                if (paymentResponse.paymentId == null) {
                  if (paymentResponse.errorMessage != null) {
                    showSnackbar(
                      context,
                      'Error: ${paymentResponse.errorMessage}',
                    );
                  }
                  return;
                }
                paymentId = paymentResponse.paymentId!;

                setState(() {});
              },
              text: 'Buy Now',
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
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Image.asset(
                'assets/images/secure-stripe-payment-logo.png',
                width: 300,
                height: 43,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
