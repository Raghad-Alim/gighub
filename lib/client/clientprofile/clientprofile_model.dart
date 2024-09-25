import '/components/nav_barclient_profile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'clientprofile_widget.dart' show ClientprofileWidget;
import 'package:flutter/material.dart';

class ClientprofileModel extends FlutterFlowModel<ClientprofileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Model for NavBarclient-profile component.
  late NavBarclientProfileModel navBarclientProfileModel;

  @override
  void initState(BuildContext context) {
    navBarclientProfileModel =
        createModel(context, () => NavBarclientProfileModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    navBarclientProfileModel.dispose();
  }
}
