import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_location_widget.dart' show ClientLocationWidget;
import 'package:flutter/material.dart';

class ClientLocationModel extends FlutterFlowModel<ClientLocationWidget> {
  ///  Local state fields for this page.

  LatLng? loc;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for locName widget.
  FocusNode? locNameFocusNode;
  TextEditingController? locNameTextController;
  String? Function(BuildContext, String?)? locNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    locNameFocusNode?.dispose();
    locNameTextController?.dispose();
  }
}
