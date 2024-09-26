import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/nav_bar_s_p_home/nav_bar_s_p_home_widget.dart';
import 'service_provider_home_page_widget.dart'
    show ServiceProviderHomePageWidget;
import 'package:flutter/material.dart';

class ServiceProviderHomePageModel
    extends FlutterFlowModel<ServiceProviderHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarSP-home component.
  late NavBarSPHomeModel navBarSPHomeModel;

  @override
  void initState(BuildContext context) {
    navBarSPHomeModel = createModel(context, () => NavBarSPHomeModel());
  }

  @override
  void dispose() {
    navBarSPHomeModel.dispose();
  }
}
