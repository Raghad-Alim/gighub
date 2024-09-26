import '/flutter_flow/flutter_flow_util.dart';
import '/service_provider/nav_bar_s_p_profile/nav_bar_s_p_profile_widget.dart';
import 's_pprofile_widget.dart' show SPprofileWidget;
import 'package:flutter/material.dart';

class SPprofileModel extends FlutterFlowModel<SPprofileWidget> {
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
  // State field(s) for Sector widget.
  FocusNode? sectorFocusNode3;
  TextEditingController? sectorTextController3;
  String? Function(BuildContext, String?)? sectorTextController3Validator;
  // State field(s) for Bio widget.
  FocusNode? bioFocusNode;
  TextEditingController? bioTextController;
  String? Function(BuildContext, String?)? bioTextControllerValidator;
  // Model for NavBarSP-profile component.
  late NavBarSPProfileModel navBarSPProfileModel;

  @override
  void initState(BuildContext context) {
    navBarSPProfileModel = createModel(context, () => NavBarSPProfileModel());
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

    sectorFocusNode3?.dispose();
    sectorTextController3?.dispose();

    bioFocusNode?.dispose();
    bioTextController?.dispose();

    navBarSPProfileModel.dispose();
  }
}
