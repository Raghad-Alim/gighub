import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/dialogs_to_copy_and_use/rating_thank_you_dialog/rating_thank_you_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rate_and_review_page_model.dart';
export 'rate_and_review_page_model.dart';

class RateAndReviewPageWidget extends StatefulWidget {
  const RateAndReviewPageWidget({
    super.key,
    required this.bookingID,
    required this.spID,
  });

  final DocumentReference? bookingID;
  final DocumentReference? spID;

  @override
  State<RateAndReviewPageWidget> createState() =>
      _RateAndReviewPageWidgetState();
}

class _RateAndReviewPageWidgetState extends State<RateAndReviewPageWidget> {
  late RateAndReviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RateAndReviewPageModel());

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();
    _model.descriptionFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserRecord>(
      stream: UserRecord.getDocument(widget.spID!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final rateAndReviewPageUserRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Your Feedback',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      color: FlutterFlowTheme.of(context).tertiary,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyLargeFamily),
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'How was your experience with ${rateAndReviewPageUserRecord.firstName} ?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 19.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) => safeSetState(
                            () => _model.ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarValue ??= 1.0,
                        unratedColor: FlutterFlowTheme.of(context).primary,
                        itemCount: 5,
                        itemSize: 45.0,
                        glowColor: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Divider(
                      thickness: 2.0,
                      indent: 10.0,
                      endIndent: 10.0,
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Care to share more about it?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 19.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _model.descriptionTextController,
                      focusNode: _model.descriptionFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Write your review here...',
                        labelStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: const Color(0xFF606A85),
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        alignLabelWithHint: true,
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: const Color(0xA3998B99),
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                              lineHeight: 2.0,
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
                      maxLines: 15,
                      cursorColor: const Color(0xFF6F61EF),
                      validator: _model.descriptionTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.02, 0.86),
                    child: Builder(
                      builder: (context) => Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await RatingsRecord.collection
                                .doc()
                                .set(createRatingsRecordData(
                                  clientFName: valueOrDefault(
                                      currentUserDocument?.firstName, ''),
                                  serviceProviderID: widget.spID,
                                  review: _model.descriptionTextController.text,
                                  rating: _model.ratingBarValue,
                                  createdTime: getCurrentTimestamp,
                                ));

                            await widget.spID!.update({
                              ...createUserRecordData(
                                aveageRating: functions.calculateNewAverage(
                                    rateAndReviewPageUserRecord.aveageRating,
                                    rateAndReviewPageUserRecord.tatalRating,
                                    _model.ratingBarValue),
                              ),
                              ...mapToFirestore(
                                {
                                  'tatalRating': FieldValue.increment(1),
                                },
                              ),
                            });

                            await widget.bookingID!
                                .update(createBookingRecordData(
                              status: 'completed',
                            ));
                            await actions.localNotification(
                              '⭐ Review Submitted!',
                              'Thank you for your feedback! Your review has been successfully submitted.',
                            );
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(dialogContext).unfocus(),
                                    child: const RatingThankYouDialogWidget(),
                                  ),
                                );
                              },
                            );

                            await ServiceProviderRecord.collection
                                .doc()
                                .set(createServiceProviderRecordData(
                                  userIdNotification: currentUserReference,
                                  titleNotification: '⭐ Review Submitted!',
                                  bodyNotification:
                                      'Thank you for your feedback! Your review has been successfully submitted.',
                                  timeStampNotification: getCurrentTimestamp,
                                ));
                          },
                          text: 'Submit your Feedback',
                          options: FFButtonOptions(
                            width: 360.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                35.0, 0.0, 35.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                50.0, 0.0, 50.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
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
      },
    );
  }
}
