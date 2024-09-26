import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_pin_location_widget.dart' show ClientPinLocationWidget;
import 'package:flutter/material.dart';

class ClientPinLocationModel extends FlutterFlowModel<ClientPinLocationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
