import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar_client/nav_barclient_chat_copy/nav_barclient_chat_copy_widget.dart';
import 'chats_client_copy_widget.dart' show ChatsClientCopyWidget;
import 'package:flutter/material.dart';

class ChatsClientCopyModel extends FlutterFlowModel<ChatsClientCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarclient--chatCopy component.
  late NavBarclientChatCopyModel navBarclientChatCopyModel;

  @override
  void initState(BuildContext context) {
    navBarclientChatCopyModel =
        createModel(context, () => NavBarclientChatCopyModel());
  }

  @override
  void dispose() {
    navBarclientChatCopyModel.dispose();
  }
}
