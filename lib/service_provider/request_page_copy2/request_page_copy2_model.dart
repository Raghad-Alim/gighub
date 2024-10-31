import '/client/nav_bar_s_p_request/nav_bar_s_p_request_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_page_copy2_widget.dart' show RequestPageCopy2Widget;
import 'package:flutter/material.dart';

class RequestPageCopy2Model extends FlutterFlowModel<RequestPageCopy2Widget> {
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
