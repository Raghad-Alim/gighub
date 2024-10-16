import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/nav_bar_s_p_booking/nav_bar_s_p_booking_widget.dart';
import 'booking_s_p_widget.dart' show BookingSPWidget;
import 'package:flutter/material.dart';

class BookingSPModel extends FlutterFlowModel<BookingSPWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBarSP-booking component.
  late NavBarSPBookingModel navBarSPBookingModel;

  @override
  void initState(BuildContext context) {
    navBarSPBookingModel = createModel(context, () => NavBarSPBookingModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBarSPBookingModel.dispose();
  }
}
