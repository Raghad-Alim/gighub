import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'search_client_no_filter_widget.dart' show SearchClientNoFilterWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SearchClientNoFilterModel
    extends FlutterFlowModel<SearchClientNoFilterWidget> {
  ///  State fields for stateful widgets in this page.

  List<UserRecord>? searchClientNoFilterPreviousSnapshot;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UserRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
