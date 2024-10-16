import '/client/nav_bar_s_p_request/nav_bar_s_p_request_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_page_widget.dart' show RequestPageWidget;
import 'package:flutter/material.dart';

class RequestPageModel extends FlutterFlowModel<RequestPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarSP-request component.
  late NavBarSPRequestModel navBarSPRequestModel;

  @override
  void initState(BuildContext context) {
    navBarSPRequestModel = createModel(context, () => NavBarSPRequestModel());
  }

  @override
  void dispose() {
    navBarSPRequestModel.dispose();
  }
}
