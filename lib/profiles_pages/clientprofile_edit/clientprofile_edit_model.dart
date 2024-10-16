import '/flutter_flow/flutter_flow_util.dart';
import 'clientprofile_edit_widget.dart' show ClientprofileEditWidget;
import 'package:flutter/material.dart';

class ClientprofileEditModel extends FlutterFlowModel<ClientprofileEditWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Your phone number must be exactly 10 digits.';
    }

    if (val.length < 10) {
      return 'Your phone number must be exactly 10 digits.';
    }
    if (val.length > 10) {
      return 'Your phone number must be exactly 10 digits.';
    }
    if (!RegExp('^05\\d{8}\$').hasMatch(val)) {
      return 'Your phone number must start with 05 .';
    }
    return null;
  }

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

  @override
  void initState(BuildContext context) {
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
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
  }
}
