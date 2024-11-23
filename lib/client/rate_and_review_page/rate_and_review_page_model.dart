import '/flutter_flow/flutter_flow_util.dart';
import 'rate_and_review_page_widget.dart' show RateAndReviewPageWidget;
import 'package:flutter/material.dart';

class RateAndReviewPageModel extends FlutterFlowModel<RateAndReviewPageWidget> {
  ///  State fields for stateful widgets in this page.

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
