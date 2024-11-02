import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ratesheet_model.dart';
export 'ratesheet_model.dart';

class RatesheetWidget extends StatefulWidget {
  const RatesheetWidget({
    super.key,
    required this.rate20,
  });

  final DocumentReference? rate20;

  @override
  State<RatesheetWidget> createState() => _RatesheetWidgetState();
}

class _RatesheetWidgetState extends State<RatesheetWidget> {
  late RatesheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatesheetModel());

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();
    _model.descriptionFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: 405.0,
        height: 457.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Rate and Review',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          safeSetState(() => _model.ratingBarValue = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.ratingBarValue ??= 0.0,
                      unratedColor: FlutterFlowTheme.of(context).primary,
                      itemCount: 5,
                      itemSize: 36.0,
                      glowColor: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: TextFormField(
                      controller: _model.descriptionTextController,
                      focusNode: _model.descriptionFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'write your review here*...',
                        labelStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: const Color(0xFF606A85),
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        alignLabelWithHint: true,
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF606A85),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Outfit'),
                                ),
                        errorStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Figtree',
                              color: const Color(0xFFFF5963),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Figtree'),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF6F61EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor:
                            (_model.descriptionFocusNode?.hasFocus ?? false)
                                ? const Color(0x4D9489F5)
                                : Colors.white,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).tertiary,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                      maxLines: 10,
                      cursorColor: const Color(0xFF6F61EF),
                      validator: _model.descriptionTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await ReviewRecord.createDoc(widget.rate20!)
                            .set(createReviewRecordData(
                          userID: widget.rate20,
                          review: _model.descriptionTextController.text,
                          rating: _model.ratingBarValue?.round(),
                          date: getCurrentTimestamp,
                        ));

                        await widget.rate20!.update({
                          ...mapToFirestore(
                            {
                              'rating': FieldValue.arrayUnion(
                                  [_model.ratingBarValue?.round()]),
                            },
                          ),
                        });
                        Navigator.pop(context);
                      },
                      text: 'Rate',
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 10.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).tertiary,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
