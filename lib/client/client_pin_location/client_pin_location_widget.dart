import '/backend/backend.dart';
import '/dialogs_to_copy_and_use/delete_location/delete_location_widget.dart';
import '/dialogs_to_copy_and_use/set_location/set_location_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'client_pin_location_model.dart';
export 'client_pin_location_model.dart';

class ClientPinLocationWidget extends StatefulWidget {
  const ClientPinLocationWidget({
    super.key,
    required this.loc,
    required this.doc,
    required this.name,
  });

  final LatLng? loc;
  final DocumentReference? doc;
  final String? name;

  @override
  State<ClientPinLocationWidget> createState() =>
      _ClientPinLocationWidgetState();
}

class _ClientPinLocationWidgetState extends State<ClientPinLocationWidget> {
  late ClientPinLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientPinLocationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
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
          ),
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              'Edit your ${widget.name} location',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).tertiary,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
          ),
          actions: [
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 19.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: FaIcon(
                    FontAwesomeIcons.trashAlt,
                    color: FlutterFlowTheme.of(context).error,
                    size: 24.0,
                  ),
                  onPressed: () async {
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
                            onTap: () => FocusScope.of(dialogContext).unfocus(),
                            child: DeleteLocationWidget(
                              locDoc: widget.doc!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 412.0,
                            height: 724.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) => safeSetState(
                                  () => _model.googleMapsCenter = latLng),
                              initialLocation: _model.googleMapsCenter ??=
                                  widget.loc!,
                              markerColor: GoogleMarkerColor.violet,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: true,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.04, 1.0),
                        child: Container(
                          width: 416.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x22000000),
                                offset: Offset(
                                  0.0,
                                  -4.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 40.0, 20.0, 35.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await widget.doc!
                                      .update(createLocationsRecordData(
                                    address: _model.googleMapsCenter,
                                  ));
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: const SetLocationWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  context.safePop();
                                },
                                text: 'Confirm Your ${widget.name} Location',
                                options: FFButtonOptions(
                                  height: 0.0,
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
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.location_pin,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 34.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
