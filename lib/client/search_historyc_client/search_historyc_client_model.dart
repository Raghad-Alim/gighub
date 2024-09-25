import '/flutter_flow/flutter_flow_util.dart';
import 'search_historyc_client_widget.dart' show SearchHistorycClientWidget;
import 'package:flutter/material.dart';

class SearchHistorycClientModel
    extends FlutterFlowModel<SearchHistorycClientWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
