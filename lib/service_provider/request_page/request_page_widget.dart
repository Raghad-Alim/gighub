import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/nav_bar_s_p_request/nav_bar_s_p_request_widget.dart';
import 'package:flutter/material.dart';
import 'request_page_model.dart';
export 'request_page_model.dart';

class RequestPageWidget extends StatefulWidget {
  /// the page where the user enter the details of the request - the page after
  /// the user clicks send request
  const RequestPageWidget({super.key});

  @override
  State<RequestPageWidget> createState() => _RequestPageWidgetState();
}

class _RequestPageWidgetState extends State<RequestPageWidget> {
  late RequestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestPageModel());

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
                  model: _model.navBarSPRequestModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarSPRequestWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
