import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/nav_bar_client/nav_barclient_home/nav_barclient_home_widget.dart';
import 'client_home_page_widget.dart' show ClientHomePageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UserRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for NavBarclient-home component.
  late NavBarclientHomeModel navBarclientHomeModel;

  @override
  void initState(BuildContext context) {
    navBarclientHomeModel = createModel(context, () => NavBarclientHomeModel());
  }

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    navBarclientHomeModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, UserRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, UserRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UserRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUserRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
