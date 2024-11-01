import '/backend/api_requests/api_calls.dart';
import '/client/nav_bar_s_p_request/nav_bar_s_p_request_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_page_copy2_widget.dart' show RequestPageCopy2Widget;
import 'package:flutter/material.dart';

class RequestPageCopy2Model extends FlutterFlowModel<RequestPageCopy2Widget> {
  ///  Local state fields for this page.

  bool apiHasResponse = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GeoCodeReverse)] action in Button widget.
  ApiCallResponse? addressReverse;
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
