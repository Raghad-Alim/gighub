import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_client_no_filter_copy_widget.dart'
    show SearchClientNoFilterCopyWidget;
import 'package:flutter/material.dart';

class SearchClientNoFilterCopyModel
    extends FlutterFlowModel<SearchClientNoFilterCopyWidget> {
  ///  State fields for stateful widgets in this page.

  List<UserRecord>? searchClientNoFilterCopyPreviousSnapshot;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<UserRecord>? algoliaSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
