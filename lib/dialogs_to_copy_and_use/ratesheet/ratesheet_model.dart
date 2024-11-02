import '/flutter_flow/flutter_flow_util.dart';
import 'ratesheet_widget.dart' show RatesheetWidget;
import 'package:flutter/material.dart';

class RatesheetModel extends FlutterFlowModel<RatesheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
