import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars_s_p/nav_bar_s_p_chat/nav_bar_s_p_chat_widget.dart';
import 'chat_s_p_copy_widget.dart' show ChatSPCopyWidget;
import 'package:flutter/material.dart';

class ChatSPCopyModel extends FlutterFlowModel<ChatSPCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarSP-chat component.
  late NavBarSPChatModel navBarSPChatModel;

  @override
  void initState(BuildContext context) {
    navBarSPChatModel = createModel(context, () => NavBarSPChatModel());
  }

  @override
  void dispose() {
    navBarSPChatModel.dispose();
  }
}
