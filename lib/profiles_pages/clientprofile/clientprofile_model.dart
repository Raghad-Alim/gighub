import '/components/nav_barclient_profile_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'clientprofile_widget.dart' show ClientprofileWidget;
import 'package:flutter/material.dart';

class ClientprofileModel extends FlutterFlowModel<ClientprofileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for Sector widget.
  FocusNode? sectorFocusNode1;
  TextEditingController? sectorTextController1;
  String? Function(BuildContext, String?)? sectorTextController1Validator;
  // State field(s) for Sector widget.
  FocusNode? sectorFocusNode2;
  TextEditingController? sectorTextController2;
  String? Function(BuildContext, String?)? sectorTextController2Validator;
  // Model for NavBarclient-profile component.
  late NavBarclientProfileModel navBarclientProfileModel;

  @override
  void initState(BuildContext context) {
    navBarclientProfileModel =
        createModel(context, () => NavBarclientProfileModel());
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    sectorFocusNode1?.dispose();
    sectorTextController1?.dispose();

    sectorFocusNode2?.dispose();
    sectorTextController2?.dispose();

    navBarclientProfileModel.dispose();
  }
}
