import '/backend/backend.dart';
import '/components/nav_barclient_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_home_page_widget.dart' show ClientHomePageWidget;
import 'package:flutter/material.dart';

class ClientHomePageModel extends FlutterFlowModel<ClientHomePageWidget> {
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

  List<UserRecord> simpleSearchResults1 = [];
  List<UserRecord> simpleSearchResults2 = [];
  List<ServiceProviderRecord> simpleSearchResults3 = [];
  List<ServiceProviderRecord> simpleSearchResults4 = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<UserRecord>? showChefs;
  List<ServiceProviderRecord> simpleSearchResults5 = [];
  List<ServiceProviderRecord> simpleSearchResults6 = [];
  List<UserRecord>? listViewPreviousSnapshot;
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
