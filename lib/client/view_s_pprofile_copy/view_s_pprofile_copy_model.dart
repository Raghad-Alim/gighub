import '/flutter_flow/flutter_flow_util.dart';
import 'view_s_pprofile_copy_widget.dart' show ViewSPprofileCopyWidget;
import 'package:flutter/material.dart';

class ViewSPprofileCopyModel extends FlutterFlowModel<ViewSPprofileCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Bio widget.
  FocusNode? bioFocusNode1;
  TextEditingController? bioTextController1;
  String? Function(BuildContext, String?)? bioTextController1Validator;
  // State field(s) for Bio widget.
  FocusNode? bioFocusNode2;
  TextEditingController? bioTextController2;
  String? Function(BuildContext, String?)? bioTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bioFocusNode1?.dispose();
    bioTextController1?.dispose();

    bioFocusNode2?.dispose();
    bioTextController2?.dispose();
  }
}
