import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_barclient_chat_model.dart';
export 'nav_barclient_chat_model.dart';

class NavBarclientChatWidget extends StatefulWidget {
  const NavBarclientChatWidget({super.key});

  @override
  State<NavBarclientChatWidget> createState() => _NavBarclientChatWidgetState();
}

class _NavBarclientChatWidgetState extends State<NavBarclientChatWidget> {
  late NavBarclientChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarclientChatModel());

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(0.0),
          ),
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: FaIcon(
                          FontAwesomeIcons.home,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 25.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('ClientHomePageCopy');
                        },
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.calendar_month_sharp,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('BookingsClient');
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.chat,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('chatsClientCopy');
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.person_outline,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 33.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('Clientprofile');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 4.0),
                  child: Text(
                    'Home',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.36, 1.05),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 5.0),
                  child: Text(
                    'Bookings',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 138.0, 5.0),
                  child: Text(
                    'Chat',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(345.0, 0.0, 0.0, 4.0),
                  child: Text(
                    'Profile',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelMediumFamily,
                          color: FlutterFlowTheme.of(context).secondary,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelMediumFamily),
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
