import '/flutter_flow/flutter_flow_util.dart';
import 'change_photo_copy_widget.dart' show ChangePhotoCopyWidget;
import 'package:flutter/material.dart';

class ChangePhotoCopyModel extends FlutterFlowModel<ChangePhotoCopyWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
