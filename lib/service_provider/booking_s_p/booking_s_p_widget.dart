import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/nav_bar_s_p_booking/nav_bar_s_p_booking_widget.dart';
import 'package:flutter/material.dart';
import 'booking_s_p_model.dart';
export 'booking_s_p_model.dart';

class BookingSPWidget extends StatefulWidget {
  const BookingSPWidget({super.key});

  @override
  State<BookingSPWidget> createState() => _BookingSPWidgetState();
}

class _BookingSPWidgetState extends State<BookingSPWidget> {
  late BookingSPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingSPModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarSPBookingModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarSPBookingWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
