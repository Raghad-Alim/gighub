import '/components/nav_barclient_booking_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bookings_client_widget.dart' show BookingsClientWidget;
import 'package:flutter/material.dart';

class BookingsClientModel extends FlutterFlowModel<BookingsClientWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBarclient-booking component.
  late NavBarclientBookingModel navBarclientBookingModel;

  @override
  void initState(BuildContext context) {
    navBarclientBookingModel =
        createModel(context, () => NavBarclientBookingModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navBarclientBookingModel.dispose();
  }
}
