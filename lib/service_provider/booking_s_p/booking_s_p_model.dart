import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bars_s_p/nav_bar_s_p_booking/nav_bar_s_p_booking_widget.dart';
import 'booking_s_p_widget.dart' show BookingSPWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BookingSPModel extends FlutterFlowModel<BookingSPWidget> {
  ///  Local state fields for this page.

  bool apiHasResponse = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BookingRecord>? listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BookingRecord>? listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BookingRecord>? listViewPagingController5;
  Query? listViewPagingQuery5;
  List<StreamSubscription?> listViewStreamSubscriptions5 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BookingRecord>? listViewPagingController6;
  Query? listViewPagingQuery6;
  List<StreamSubscription?> listViewStreamSubscriptions6 = [];

  // Model for NavBarSP-booking component.
  late NavBarSPBookingModel navBarSPBookingModel;

  @override
  void initState(BuildContext context) {
    navBarSPBookingModel = createModel(context, () => NavBarSPBookingModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    for (var s in listViewStreamSubscriptions2) {
      s?.cancel();
    }
    listViewPagingController2?.dispose();

    for (var s in listViewStreamSubscriptions3) {
      s?.cancel();
    }
    listViewPagingController3?.dispose();

    for (var s in listViewStreamSubscriptions5) {
      s?.cancel();
    }
    listViewPagingController5?.dispose();

    for (var s in listViewStreamSubscriptions6) {
      s?.cancel();
    }
    listViewPagingController6?.dispose();

    navBarSPBookingModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, BookingRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, BookingRecord> _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, BookingRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, BookingRecord> _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, BookingRecord> setListViewController5(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController5 ??= _createListViewController5(query, parent);
    if (listViewPagingQuery5 != query) {
      listViewPagingQuery5 = query;
      listViewPagingController5?.refresh();
    }
    return listViewPagingController5!;
  }

  PagingController<DocumentSnapshot?, BookingRecord> _createListViewController5(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery5 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions5,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, BookingRecord> setListViewController6(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController6 ??= _createListViewController6(query, parent);
    if (listViewPagingQuery6 != query) {
      listViewPagingQuery6 = query;
      listViewPagingController6?.refresh();
    }
    return listViewPagingController6!;
  }

  PagingController<DocumentSnapshot?, BookingRecord> _createListViewController6(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery6 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions6,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
