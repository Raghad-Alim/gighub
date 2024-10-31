import '/backend/backend.dart';
import '/components/nav_barclient_home_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_home_page_widget.dart' show ClientHomePageWidget;
import 'package:flutter/material.dart';

class ClientHomePageModel extends FlutterFlowModel<ClientHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  List<UserRecord> simpleSearchResults1 = [];
  List<UserRecord> simpleSearchResults2 = [];
  List<UserRecord> simpleSearchResults3 = [];
  List<ServiceProviderRecord> simpleSearchResults4 = [];
  List<ServiceProviderRecord> simpleSearchResults5 = [];
  List<ServiceProviderRecord> simpleSearchResults6 = [];
  List<ServiceProviderRecord> simpleSearchResults7 = [];
  List<ServiceProviderRecord> simpleSearchResults8 = [];
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
