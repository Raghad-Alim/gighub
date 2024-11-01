import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Image.asset(
            'assets/images/IMG_2797-removebg-preview_2.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'CreateAccountClient': (data) async => ParameterData(
        allParams: {
          'place': getParameter<LatLng>(data, 'place'),
          'marker': getParameter<LatLng>(data, 'marker'),
        },
      ),
  'BookingsClient': ParameterData.none(),
  'Clientprofile': ParameterData.none(),
  'searchClient': ParameterData.none(),
  'createAccountSP': (data) async => ParameterData(
        allParams: {
          'marker': getParameter<LatLng>(data, 'marker'),
        },
      ),
  'SPprofile': ParameterData.none(),
  'ClientHomePage': ParameterData.none(),
  'ServiceProviderHomePage': ParameterData.none(),
  'verificationMessageSP': ParameterData.none(),
  'searchHistorycClient': ParameterData.none(),
  'forgetpass': ParameterData.none(),
  'requestPage': ParameterData.none(),
  'accountType': ParameterData.none(),
  'BookingSP': ParameterData.none(),
  'resetpassaftersending': ParameterData.none(),
  'verificationMessageClient': ParameterData.none(),
  'SPlocationfromHP': ParameterData.none(),
  'loginpage': ParameterData.none(),
  'errormsg': ParameterData.none(),
  'clientPinLocation': ParameterData.none(),
  'CreateAvailability': ParameterData.none(),
  'requestPageCopy': (data) async => ParameterData(
        allParams: {
          'price': getParameter<double>(data, 'price'),
          'serviceProviderReference':
              getParameter<DocumentReference>(data, 'serviceProviderReference'),
          'sector': getParameter<String>(data, 'sector'),
        },
      ),
  'List03UserSelectCopy2': (data) async => ParameterData(
        allParams: {
          'isSunday': getParameter<bool>(data, 'isSunday'),
          'isMonday': getParameter<bool>(data, 'isMonday'),
          'isTuesday': getParameter<bool>(data, 'isTuesday'),
          'isWednesday': getParameter<bool>(data, 'isWednesday'),
          'isThursday': getParameter<bool>(data, 'isThursday'),
          'isFriday': getParameter<bool>(data, 'isFriday'),
          'isSaturday': getParameter<bool>(data, 'isSaturday'),
        },
      ),
  'UpdateAvailability': ParameterData.none(),
  'viewDetailsAccepted': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<DocumentReference>(data, 'bookingID'),
          'bookingDate': getParameter<DateTime>(data, 'bookingDate'),
          'bookingTime': getParameter<DateTime>(data, 'bookingTime'),
          'bookingComment': getParameter<String>(data, 'bookingComment'),
          'bookingLocation': getParameter<LatLng>(data, 'bookingLocation'),
          'bookingPrice': getParameter<double>(data, 'bookingPrice'),
        },
      ),
  'viewDetailsPay': (data) async => ParameterData(
        allParams: {
          'bookingIDPay': getParameter<DocumentReference>(data, 'bookingIDPay'),
          'bookingTimePay': getParameter<DateTime>(data, 'bookingTimePay'),
          'bookingDatePay': getParameter<DateTime>(data, 'bookingDatePay'),
          'commentPay': getParameter<String>(data, 'commentPay'),
          'locationPay': getParameter<LatLng>(data, 'locationPay'),
          'pricePay': getParameter<double>(data, 'pricePay'),
          'clientEmail': getParameter<String>(data, 'clientEmail'),
          'clientFirstName': getParameter<String>(data, 'clientFirstName'),
          'clientLastName': getParameter<String>(data, 'clientLastName'),
        },
      ),
  'viewDetailsPending': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<String>(data, 'bookingID'),
          'bookingTime': getParameter<DateTime>(data, 'bookingTime'),
          'bookingDate': getParameter<DateTime>(data, 'bookingDate'),
          'comment': getParameter<String>(data, 'comment'),
          'location': getParameter<LatLng>(data, 'location'),
          'price': getParameter<double>(data, 'price'),
        },
      ),
  'viewDetailsUpcomingPage': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<String>(data, 'bookingID'),
          'bookingtime': getParameter<DateTime>(data, 'bookingtime'),
          'bookingDate': getParameter<DateTime>(data, 'bookingDate'),
          'bookingClientLocation':
              getParameter<LatLng>(data, 'bookingClientLocation'),
          'clientComment': getParameter<String>(data, 'clientComment'),
          'bookingPay': getParameter<double>(data, 'bookingPay'),
          'city': getParameter<String>(data, 'city'),
        },
      ),
  'viewDetailsRequestPage': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<String>(data, 'bookingID'),
          'bookingtime': getParameter<DateTime>(data, 'bookingtime'),
          'bookingDate': getParameter<DateTime>(data, 'bookingDate'),
          'bookingClientLocation':
              getParameter<LatLng>(data, 'bookingClientLocation'),
          'clientComment': getParameter<String>(data, 'clientComment'),
          'bookingPay': getParameter<double>(data, 'bookingPay'),
          'city': getParameter<String>(data, 'city'),
        },
      ),
  'ClientprofileEdit': ParameterData.none(),
  'hhh': ParameterData.none(),
  'testDialogs': ParameterData.none(),
  'SPprofileEdit': ParameterData.none(),
  'CreateAvailabilitySP2': (data) async => const ParameterData(
        allParams: {},
      ),
  'YoutubeRequestPage': (data) async => ParameterData(
        allParams: {
          'spRef': getParameter<DocumentReference>(data, 'spRef'),
          'sector': getParameter<String>(data, 'sector'),
          'price': getParameter<int>(data, 'price'),
          'service': getParameter<String>(data, 'service'),
        },
      ),
  'CreateAvailabilitySP2Copy': (data) async => const ParameterData(
        allParams: {},
      ),
  'CreateAvailabilitySP2Copy2': (data) async => const ParameterData(
        allParams: {},
      ),
  'ClientlLoginpageCopyCopy': ParameterData.none(),
  'danah': ParameterData.none(),
  'dupplogin': ParameterData.none(),
  'clientlogindupppppp': ParameterData.none(),
  'SPprofileEditCopy': ParameterData.none(),
  'chatPage': (data) async => ParameterData(
        allParams: {
          'receiveChat': getParameter<DocumentReference>(data, 'receiveChat'),
          'bookingID': getParameter<String>(data, 'bookingID'),
        },
      ),
  'CreateAccountClientCopy': (data) async => ParameterData(
        allParams: {
          'place': getParameter<LatLng>(data, 'place'),
          'location': getParameter<DocumentReference>(data, 'location'),
        },
      ),
  'clientLocation': ParameterData.none(),
  'YoutubeRequestPageCopy': (data) async => ParameterData(
        allParams: {
          'spRef': getParameter<DocumentReference>(data, 'spRef'),
          'sector': getParameter<String>(data, 'sector'),
          'price': getParameter<int>(data, 'price'),
          'service': getParameter<String>(data, 'service'),
        },
      ),
  'chats': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<String>(data, 'bookingID'),
        },
      ),
  'chatSP': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<String>(data, 'bookingID'),
        },
      ),
  'chatsClient': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<DocumentReference>(data, 'bookingID'),
        },
      ),
  'chataddSP': ParameterData.none(),
  'viewDetailsPayCopy': (data) async => ParameterData(
        allParams: {
          'bookingIDPay': getParameter<DocumentReference>(data, 'bookingIDPay'),
          'bookingTimePay': getParameter<DateTime>(data, 'bookingTimePay'),
          'bookingDatePay': getParameter<DateTime>(data, 'bookingDatePay'),
          'commentPay': getParameter<String>(data, 'commentPay'),
          'locationPay': getParameter<LatLng>(data, 'locationPay'),
          'pricePay': getParameter<double>(data, 'pricePay'),
          'clientEmail': getParameter<String>(data, 'clientEmail'),
          'clientFirstName': getParameter<String>(data, 'clientFirstName'),
          'clientLastName': getParameter<String>(data, 'clientLastName'),
        },
      ),
  'requestPageCopy2': ParameterData.none(),
  'chatSPCopy': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<String>(data, 'bookingID'),
        },
      ),
  'chatsClientCopy': (data) async => ParameterData(
        allParams: {
          'bookingID': getParameter<DocumentReference>(data, 'bookingID'),
        },
      ),
  'ViewSPprofile': (data) async => ParameterData(
        allParams: {
          'parameterProfile': await getDocumentParameter<UserRecord>(
              data, 'parameterProfile', UserRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
