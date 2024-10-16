import '/flutter_flow/flutter_flow_util.dart';
import 's_pprofile_edit_widget.dart' show SPprofileEditWidget;
import 'package:flutter/material.dart';

class SPprofileEditModel extends FlutterFlowModel<SPprofileEditWidget> {
  ///  Local state fields for this page.

  String photo =
      'https://images.unsplash.com/photo-1534309466160-70b22cc6f854?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8bGVnb3xlbnwwfHx8fDE3Mjg3MjU4Mzd8MA&ixlib=rb-4.0.3&q=80&w=1080';

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
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
  // State field(s) for Sector widget.
  FocusNode? sectorFocusNode3;
  TextEditingController? sectorTextController3;
  String? Function(BuildContext, String?)? sectorTextController3Validator;
  // State field(s) for Bio widget.
  FocusNode? bioFocusNode;
  TextEditingController? bioTextController;
  String? Function(BuildContext, String?)? bioTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  String? _textController9Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Price must be between 1-4 digits';
    }

    if (val.isEmpty) {
      return 'Price must be between 1-4 digits';
    }
    if (val.length > 4) {
      return 'Price must be between 1-4 digits';
    }
    if (!RegExp('^\\d{1,4}\$').hasMatch(val)) {
      return 'Price must be between 1-4 digits';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    textController9Validator = _textController9Validator;
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

    textFieldFocusNode?.dispose();
    textController9?.dispose();
  }
}
