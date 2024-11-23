import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/dialogs_to_copy_and_use/location_saved/location_saved_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'add_location_model.dart';
export 'add_location_model.dart';

class AddLocationWidget extends StatefulWidget {
  const AddLocationWidget({super.key});

  @override
  State<AddLocationWidget> createState() => _AddLocationWidgetState();
}

class _AddLocationWidgetState extends State<AddLocationWidget> {
  late AddLocationModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddLocationModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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
                    'Add new location',
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
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: SizedBox(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.descriptionTextController,
                        focusNode: _model.descriptionFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: const Color(0xFF606A85),
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          hintText: 'Location name',
                          hintStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                color: FlutterFlowTheme.of(context).roseQuartz,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).roseQuartz,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .labelMediumFamily,
                              color: FlutterFlowTheme.of(context).roseQuartz,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelMediumFamily),
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.descriptionTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 0.0),
                    child: Container(
                      width: 396.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) =>
                                _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??=
                                currentUserLocationValue!,
                            markerColor: GoogleMarkerColor.violet,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.03, -0.05),
                            child: PointerInterceptor(
                              intercepting: isWeb,
                              child: Icon(
                                Icons.location_pin,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await LocationsRecord.collection
                              .doc()
                              .set(createLocationsRecordData(
                                owner: currentUserReference,
                                address: _model.googleMapsCenter,
                                locName: _model.descriptionTextController.text,
                              ));
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: LocationSavedWidget(
                                  loc: _model.googleMapsCenter!,
                                  locName:
                                      _model.descriptionTextController.text,
                                ),
                              );
                            },
                          );

                          context.safePop();
                        },
                        text: 'Save',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 45.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
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
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 4.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
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
