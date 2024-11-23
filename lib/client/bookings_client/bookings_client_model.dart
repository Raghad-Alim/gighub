import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/nav_bar_client/nav_barclient_booking/nav_barclient_booking_widget.dart';
import 'bookings_client_widget.dart' show BookingsClientWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BookingsClientModel extends FlutterFlowModel<BookingsClientWidget> {
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

  PagingController<DocumentSnapshot?, BookingRecord>? listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BookingRecord>? listViewPagingController7;
  Query? listViewPagingQuery7;
  List<StreamSubscription?> listViewStreamSubscriptions7 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BookingRecord>? listViewPagingController9;
  Query? listViewPagingQuery9;
  List<StreamSubscription?> listViewStreamSubscriptions9 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BookingRecord>?
      listViewPagingController10;
  Query? listViewPagingQuery10;
  List<StreamSubscription?> listViewStreamSubscriptions10 = [];

  // Model for NavBarclient-booking component.
  late NavBarclientBookingModel navBarclientBookingModel;

  @override
  void initState(BuildContext context) {
    navBarclientBookingModel =
        createModel(context, () => NavBarclientBookingModel());
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

    for (var s in listViewStreamSubscriptions4) {
      s?.cancel();
    }
    listViewPagingController4?.dispose();

    for (var s in listViewStreamSubscriptions7) {
      s?.cancel();
    }
    listViewPagingController7?.dispose();

    for (var s in listViewStreamSubscriptions9) {
      s?.cancel();
    }
    listViewPagingController9?.dispose();

    for (var s in listViewStreamSubscriptions10) {
      s?.cancel();
    }
    listViewPagingController10?.dispose();

    navBarclientBookingModel.dispose();
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

  PagingController<DocumentSnapshot?, BookingRecord> setListViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController4 ??= _createListViewController4(query, parent);
    if (listViewPagingQuery4 != query) {
      listViewPagingQuery4 = query;
      listViewPagingController4?.refresh();
    }
    return listViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, BookingRecord> _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery4 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, BookingRecord> setListViewController7(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController7 ??= _createListViewController7(query, parent);
    if (listViewPagingQuery7 != query) {
      listViewPagingQuery7 = query;
      listViewPagingController7?.refresh();
    }
    return listViewPagingController7!;
  }

  PagingController<DocumentSnapshot?, BookingRecord> _createListViewController7(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery7 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions7,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, BookingRecord> setListViewController9(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController9 ??= _createListViewController9(query, parent);
    if (listViewPagingQuery9 != query) {
      listViewPagingQuery9 = query;
      listViewPagingController9?.refresh();
    }
    return listViewPagingController9!;
  }

  PagingController<DocumentSnapshot?, BookingRecord> _createListViewController9(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery9 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions9,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, BookingRecord> setListViewController10(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController10 ??= _createListViewController10(query, parent);
    if (listViewPagingQuery10 != query) {
      listViewPagingQuery10 = query;
      listViewPagingController10?.refresh();
    }
    return listViewPagingController10!;
  }

  PagingController<DocumentSnapshot?, BookingRecord>
      _createListViewController10(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingRecordPage(
          queryBuilder: (_) => listViewPagingQuery10 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions10,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
