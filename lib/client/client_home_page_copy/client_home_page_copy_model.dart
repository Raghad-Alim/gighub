import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar_client/nav_barclient_home/nav_barclient_home_widget.dart';
import 'client_home_page_copy_widget.dart' show ClientHomePageCopyWidget;
import 'package:flutter/material.dart';

class ClientHomePageCopyModel
    extends FlutterFlowModel<ClientHomePageCopyWidget> {
  ///  Local state fields for this page.

  List<UserRecord> showDrivers = [];
  void addToShowDrivers(UserRecord item) => showDrivers.add(item);
  void removeFromShowDrivers(UserRecord item) => showDrivers.remove(item);
  void removeAtIndexFromShowDrivers(int index) => showDrivers.removeAt(index);
  void insertAtIndexInShowDrivers(int index, UserRecord item) =>
      showDrivers.insert(index, item);
  void updateShowDriversAtIndex(int index, Function(UserRecord) updateFn) =>
      showDrivers[index] = updateFn(showDrivers[index]);

  ///  State fields for stateful widgets in this page.

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
