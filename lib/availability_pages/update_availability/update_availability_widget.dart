import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'update_availability_model.dart';
export 'update_availability_model.dart';

class UpdateAvailabilityWidget extends StatefulWidget {
  const UpdateAvailabilityWidget({super.key});

  @override
  State<UpdateAvailabilityWidget> createState() =>
      _UpdateAvailabilityWidgetState();
}

class _UpdateAvailabilityWidgetState extends State<UpdateAvailabilityWidget> {
  late UpdateAvailabilityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateAvailabilityModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await queryAvailabilityRecordOnce(
        queryBuilder: (availabilityRecord) => availabilityRecord.where(
          'availableID',
          isEqualTo: currentUserEmail,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AvailabilityRecord>>(
      stream: queryAvailabilityRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<AvailabilityRecord> updateAvailabilityAvailabilityRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final updateAvailabilityAvailabilityRecord =
            updateAvailabilityAvailabilityRecordList.isNotEmpty
                ? updateAvailabilityAvailabilityRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set Availability ',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: const Color(0xFF14181B),
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Outfit'),
                        ),
                  ),
                  Text(
                    'Days and times',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF57636C),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap()
                              .containsKey('Plus Jakarta Sans'),
                        ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 4.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 44.0,
                    fillColor: const Color(0xFFE0E3E7),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF57636C),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('SPprofile');
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: LinearPercentIndicator(
                        percent: 1.0,
                        lineHeight: 10.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).tertiary,
                        backgroundColor: const Color(0xFFE0E3E7),
                        barRadius: const Radius.circular(0.0),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                'please select  your available days and times :',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF57636C),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Plus Jakarta Sans'),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE0E3E7),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            const Color(0xFF57636C),
                                      ),
                                      child: CheckboxListTile(
                                        value: _model.checkboxListTileValue1 ??=
                                            updateAvailabilityAvailabilityRecord!
                                                .isSunday,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxListTileValue1 =
                                                  newValue!);
                                        },
                                        title: Text(
                                          'Sunday',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        'Plus Jakarta Sans'),
                                                lineHeight: 2.0,
                                              ),
                                        ),
                                        tileColor: Colors.white,
                                        activeColor: const Color(0xFF4B39EF),
                                        checkColor: Colors.white,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.checkboxListTileValue1 ?? true)
                                    FlutterFlowDropDown<String>(
                                      multiSelectController:
                                          _model.dropDownValueController1 ??=
                                              FormListFieldController<String>(
                                                  _model.dropDownValue1 ??=
                                                      List<String>.from(
                                        updateAvailabilityAvailabilityRecord
                                                ?.sundayTimeSlots ??
                                            [],
                                      )),
                                      options: FFAppState().Slots,
                                      width: 200.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) =>
                                          safeSetState(() =>
                                              _model.dropDownValue1 = val),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE0E3E7),
                                  width: 1.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Theme(
                                          data: ThemeData(
                                            unselectedWidgetColor:
                                                const Color(0xFF57636C),
                                          ),
                                          child: CheckboxListTile(
                                            value: _model
                                                    .checkboxListTileValue2 ??=
                                                updateAvailabilityAvailabilityRecord!
                                                    .isMonday,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                      .checkboxListTileValue2 =
                                                  newValue!);
                                            },
                                            title: Text(
                                              'Monday',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF14181B),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                        lineHeight: 2.0,
                                                      ),
                                            ),
                                            tileColor: Colors.white,
                                            activeColor: const Color(0xFF4B39EF),
                                            checkColor: Colors.white,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_model.checkboxListTileValue2 ?? true)
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.91, -0.17),
                                      child: FlutterFlowDropDown<String>(
                                        multiSelectController:
                                            _model.dropDownValueController2 ??=
                                                FormListFieldController<String>(
                                                    _model.dropDownValue2 ??=
                                                        List<String>.from(
                                          updateAvailabilityAvailabilityRecord
                                                  ?.mondayTimeSlots ??
                                              [],
                                        )),
                                        options: FFAppState().Slots,
                                        width: 200.0,
                                        height: 40.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        hintText: 'Select...',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: true,
                                        onMultiSelectChanged: (val) =>
                                            safeSetState(() =>
                                                _model.dropDownValue2 = val),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE0E3E7),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            const Color(0xFF57636C),
                                      ),
                                      child: CheckboxListTile(
                                        value: _model.checkboxListTileValue3 ??=
                                            updateAvailabilityAvailabilityRecord!
                                                .isTuesday,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxListTileValue3 =
                                                  newValue!);
                                        },
                                        title: Text(
                                          'Tuesday',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        'Plus Jakarta Sans'),
                                                lineHeight: 2.0,
                                              ),
                                        ),
                                        tileColor: Colors.white,
                                        activeColor: const Color(0xFF4B39EF),
                                        checkColor: Colors.white,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.checkboxListTileValue3 ?? true)
                                    FlutterFlowDropDown<String>(
                                      multiSelectController:
                                          _model.dropDownValueController3 ??=
                                              FormListFieldController<String>(
                                                  _model.dropDownValue3 ??=
                                                      List<String>.from(
                                        updateAvailabilityAvailabilityRecord
                                                ?.tuesdayTimeSlots ??
                                            [],
                                      )),
                                      options: FFAppState().Slots,
                                      width: 200.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) =>
                                          safeSetState(() =>
                                              _model.dropDownValue3 = val),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE0E3E7),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            const Color(0xFF57636C),
                                      ),
                                      child: CheckboxListTile(
                                        value: _model.checkboxListTileValue4 ??=
                                            updateAvailabilityAvailabilityRecord!
                                                .isWednesday,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxListTileValue4 =
                                                  newValue!);
                                        },
                                        title: Text(
                                          'Wednesday',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        'Plus Jakarta Sans'),
                                                lineHeight: 2.0,
                                              ),
                                        ),
                                        tileColor: Colors.white,
                                        activeColor: const Color(0xFF4B39EF),
                                        checkColor: Colors.white,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.checkboxListTileValue4 ?? true)
                                    FlutterFlowDropDown<String>(
                                      multiSelectController:
                                          _model.dropDownValueController4 ??=
                                              FormListFieldController<String>(
                                                  _model.dropDownValue4 ??=
                                                      List<String>.from(
                                        updateAvailabilityAvailabilityRecord
                                                ?.wednesdayTimeSlots ??
                                            [],
                                      )),
                                      options: FFAppState().Slots,
                                      width: 200.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) =>
                                          safeSetState(() =>
                                              _model.dropDownValue4 = val),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE0E3E7),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            const Color(0xFF57636C),
                                      ),
                                      child: CheckboxListTile(
                                        value: _model.checkboxListTileValue5 ??=
                                            updateAvailabilityAvailabilityRecord!
                                                .isThursday,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxListTileValue5 =
                                                  newValue!);
                                        },
                                        title: Text(
                                          'Thursday',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        'Plus Jakarta Sans'),
                                                lineHeight: 2.0,
                                              ),
                                        ),
                                        tileColor: Colors.white,
                                        activeColor: const Color(0xFF4B39EF),
                                        checkColor: Colors.white,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.checkboxListTileValue5 ?? true)
                                    FlutterFlowDropDown<String>(
                                      multiSelectController:
                                          _model.dropDownValueController5 ??=
                                              FormListFieldController<String>(
                                                  _model.dropDownValue5 ??=
                                                      List<String>.from(
                                        updateAvailabilityAvailabilityRecord
                                                ?.thursdayTimeSlots ??
                                            [],
                                      )),
                                      options: FFAppState().Slots,
                                      width: 200.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) =>
                                          safeSetState(() =>
                                              _model.dropDownValue5 = val),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE0E3E7),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            const Color(0xFF57636C),
                                      ),
                                      child: CheckboxListTile(
                                        value: _model.checkboxListTileValue6 ??=
                                            updateAvailabilityAvailabilityRecord!
                                                .isFriday,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxListTileValue6 =
                                                  newValue!);
                                        },
                                        title: Text(
                                          'Friday',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        'Plus Jakarta Sans'),
                                                lineHeight: 2.0,
                                              ),
                                        ),
                                        tileColor: Colors.white,
                                        activeColor: const Color(0xFF4B39EF),
                                        checkColor: Colors.white,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.checkboxListTileValue6 ?? true)
                                    FlutterFlowDropDown<String>(
                                      multiSelectController:
                                          _model.dropDownValueController6 ??=
                                              FormListFieldController<String>(
                                                  _model.dropDownValue6 ??=
                                                      List<String>.from(
                                        updateAvailabilityAvailabilityRecord
                                                ?.fridayTimeSlots ??
                                            [],
                                      )),
                                      options: FFAppState().Slots,
                                      width: 200.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) =>
                                          safeSetState(() =>
                                              _model.dropDownValue6 = val),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE0E3E7),
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            const Color(0xFF57636C),
                                      ),
                                      child: CheckboxListTile(
                                        value: _model.checkboxListTileValue7 ??=
                                            updateAvailabilityAvailabilityRecord!
                                                .isSaturday,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.checkboxListTileValue7 =
                                                  newValue!);
                                        },
                                        title: Text(
                                          'Saturday',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        'Plus Jakarta Sans'),
                                                lineHeight: 2.0,
                                              ),
                                        ),
                                        tileColor: Colors.white,
                                        activeColor: const Color(0xFF4B39EF),
                                        checkColor: Colors.white,
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.checkboxListTileValue7 ?? true)
                                    FlutterFlowDropDown<String>(
                                      multiSelectController:
                                          _model.dropDownValueController7 ??=
                                              FormListFieldController<String>(
                                                  _model.dropDownValue7 ??=
                                                      List<String>.from(
                                        updateAvailabilityAvailabilityRecord
                                                ?.saturdayTimeSlots ??
                                            [],
                                      )),
                                      options: FFAppState().Slots,
                                      width: 200.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) =>
                                          safeSetState(() =>
                                              _model.dropDownValue7 = val),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 140.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xCCFFFFFF), Colors.white],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await updateAvailabilityAvailabilityRecord!.reference
                            .update({
                          ...createAvailabilityRecordData(
                            isSunday: _model.checkboxListTileValue1,
                            isMonday: _model.checkboxListTileValue2,
                            isTuesday: _model.checkboxListTileValue3,
                            isWednesday: _model.checkboxListTileValue4,
                            isThursday: _model.checkboxListTileValue5,
                            isFriday: _model.checkboxListTileValue6,
                            isSaturday: _model.checkboxListTileValue7,
                            availableID: currentUserEmail,
                          ),
                          ...mapToFirestore(
                            {
                              'SundayTimeSlots': _model.dropDownValue1,
                              'MondayTimeSlots': _model.dropDownValue2,
                              'TuesdayTimeSlots': _model.dropDownValue3,
                              'WednesdayTimeSlots': _model.dropDownValue4,
                              'ThursdayTimeSlots': _model.dropDownValue5,
                              'FridayTimeSlots': _model.dropDownValue6,
                              'SaturdayTimeSlots': _model.dropDownValue7,
                            },
                          ),
                        });

                        context.pushNamed('SPprofile');
                      },
                      text: 'Save changes',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
