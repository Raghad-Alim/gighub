import '/components/nav_barclient_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'client_home_page_widget.dart' show ClientHomePageWidget;
import 'package:flutter/material.dart';

class ClientHomePageModel extends FlutterFlowModel<ClientHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for NavBarclient-home component.
  late NavBarclientHomeModel navBarclientHomeModel;

  @override
  void initState(BuildContext context) {
    navBarclientHomeModel = createModel(context, () => NavBarclientHomeModel());
  }

  @override
  void dispose() {
    navBarclientHomeModel.dispose();
  }
}
