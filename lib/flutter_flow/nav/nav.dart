import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const ServiceProviderHomePageWidget()
          : const ClientlLoginpageCopyWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const ServiceProviderHomePageWidget()
              : const ClientlLoginpageCopyWidget(),
        ),
        FFRoute(
          name: 'CreateAccountClient',
          path: '/updateAccountClient',
          builder: (context, params) => CreateAccountClientWidget(
            place: params.getParam(
              'place',
              ParamType.LatLng,
            ),
            location: params.getParam(
              'location',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'BookingsClient',
          path: '/bookingsClient',
          builder: (context, params) => const BookingsClientWidget(),
        ),
        FFRoute(
          name: 'Clientprofile',
          path: '/clientprofile',
          builder: (context, params) => const ClientprofileWidget(),
        ),
        FFRoute(
          name: 'searchClient',
          path: '/searchClient',
          builder: (context, params) => const SearchClientWidget(),
        ),
        FFRoute(
          name: 'createAccountSP',
          path: '/createAccountSP',
          builder: (context, params) => const CreateAccountSPWidget(),
        ),
        FFRoute(
          name: 'SPprofile',
          path: '/sPprofile',
          builder: (context, params) => const SPprofileWidget(),
        ),
        FFRoute(
          name: 'ClientHomePage',
          path: '/clientHomePage',
          builder: (context, params) => const ClientHomePageWidget(),
        ),
        FFRoute(
          name: 'ServiceProviderHomePage',
          path: '/serviceProviderHomePage',
          requireAuth: true,
          builder: (context, params) => const ServiceProviderHomePageWidget(),
        ),
        FFRoute(
          name: 'verificationMessageSP',
          path: '/verificationMessageSP',
          builder: (context, params) => const VerificationMessageSPWidget(),
        ),
        FFRoute(
          name: 'searchHistorycClient',
          path: '/searchHistorycClient',
          builder: (context, params) => const SearchHistorycClientWidget(),
        ),
        FFRoute(
          name: 'forgetpass',
          path: '/forgetpass',
          builder: (context, params) => const ForgetpassWidget(),
        ),
        FFRoute(
          name: 'requestPage',
          path: '/requestPage',
          builder: (context, params) => const RequestPageWidget(),
        ),
        FFRoute(
          name: 'accountType',
          path: '/accountType',
          builder: (context, params) => const AccountTypeWidget(),
        ),
        FFRoute(
          name: 'BookingSP',
          path: '/bookingSP',
          builder: (context, params) => const BookingSPWidget(),
        ),
        FFRoute(
          name: 'resetpassaftersending',
          path: '/resetpassaftersending',
          builder: (context, params) => const ResetpassaftersendingWidget(),
        ),
        FFRoute(
          name: 'verificationMessageClient',
          path: '/verificationMessageClient',
          builder: (context, params) => const VerificationMessageClientWidget(),
        ),
        FFRoute(
          name: 'SPlocationfromHP',
          path: '/sPlocationfromHP',
          builder: (context, params) => const SPlocationfromHPWidget(),
        ),
        FFRoute(
          name: 'ClientlLoginpageCopy',
          path: '/clientlLoginpageCopy',
          builder: (context, params) => const ClientlLoginpageCopyWidget(),
        ),
        FFRoute(
          name: 'errormsg',
          path: '/errormsg',
          builder: (context, params) => const ErrormsgWidget(),
        ),
        FFRoute(
          name: 'clientPinLocation',
          path: '/SPlocationfromHPCopy',
          builder: (context, params) => const ClientPinLocationWidget(),
        ),
        FFRoute(
          name: 'CreateAvailability',
          path: '/CreateAvailability',
          builder: (context, params) => const CreateAvailabilityWidget(),
        ),
        FFRoute(
          name: 'requestPageCopy',
          path: '/requestPageCopy',
          builder: (context, params) => RequestPageCopyWidget(
            price: params.getParam(
              'price',
              ParamType.double,
            ),
            serviceProviderReference: params.getParam(
              'serviceProviderReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
            sector: params.getParam(
              'sector',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'List03UserSelectCopy',
          path: '/list03UserSelectCopy',
          builder: (context, params) => const List03UserSelectCopyWidget(),
        ),
        FFRoute(
          name: 'List03UserSelectCopy2',
          path: '/list03UserSelectCopy2',
          builder: (context, params) => List03UserSelectCopy2Widget(
            isSunday: params.getParam(
              'isSunday',
              ParamType.bool,
            ),
            isMonday: params.getParam(
              'isMonday',
              ParamType.bool,
            ),
            isTuesday: params.getParam(
              'isTuesday',
              ParamType.bool,
            ),
            isWednesday: params.getParam(
              'isWednesday',
              ParamType.bool,
            ),
            isThursday: params.getParam(
              'isThursday',
              ParamType.bool,
            ),
            isFriday: params.getParam(
              'isFriday',
              ParamType.bool,
            ),
            isSaturday: params.getParam(
              'isSaturday',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'UpdateAvailability',
          path: '/UpdateAvailability',
          builder: (context, params) => const UpdateAvailabilityWidget(),
        ),
        FFRoute(
          name: 'viewDetailsAccepted',
          path: '/viewDetailsAccepted',
          builder: (context, params) => ViewDetailsAcceptedWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['booking'],
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.DateTime,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.DateTime,
            ),
            bookingComment: params.getParam(
              'bookingComment',
              ParamType.String,
            ),
            bookingLocation: params.getParam(
              'bookingLocation',
              ParamType.LatLng,
            ),
            bookingPrice: params.getParam(
              'bookingPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'viewDetailsPay',
          path: '/viewDetails',
          builder: (context, params) => ViewDetailsPayWidget(
            bookingIDPay: params.getParam(
              'bookingIDPay',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['booking'],
            ),
            bookingTimePay: params.getParam(
              'bookingTimePay',
              ParamType.DateTime,
            ),
            bookingDatePay: params.getParam(
              'bookingDatePay',
              ParamType.DateTime,
            ),
            commentPay: params.getParam(
              'commentPay',
              ParamType.String,
            ),
            locationPay: params.getParam(
              'locationPay',
              ParamType.LatLng,
            ),
            pricePay: params.getParam(
              'pricePay',
              ParamType.double,
            ),
            clientEmail: params.getParam(
              'clientEmail',
              ParamType.String,
            ),
            clientFirstName: params.getParam(
              'clientFirstName',
              ParamType.String,
            ),
            clientLastName: params.getParam(
              'clientLastName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'viewDetailsPending',
          path: '/viewDetailscopy',
          builder: (context, params) => ViewDetailsPendingWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.String,
            ),
            bookingTime: params.getParam(
              'bookingTime',
              ParamType.DateTime,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.DateTime,
            ),
            comment: params.getParam(
              'comment',
              ParamType.String,
            ),
            location: params.getParam(
              'location',
              ParamType.LatLng,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'viewDetailsUpcomingPage',
          path: '/viewDetailsUpcomingPage',
          builder: (context, params) => ViewDetailsUpcomingPageWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.String,
            ),
            bookingtime: params.getParam(
              'bookingtime',
              ParamType.DateTime,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.DateTime,
            ),
            bookingClientLocation: params.getParam(
              'bookingClientLocation',
              ParamType.LatLng,
            ),
            clientComment: params.getParam(
              'clientComment',
              ParamType.String,
            ),
            bookingPay: params.getParam(
              'bookingPay',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'viewDetailsRequestPage',
          path: '/viewDetailsRequestPage',
          builder: (context, params) => ViewDetailsRequestPageWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.String,
            ),
            bookingtime: params.getParam(
              'bookingtime',
              ParamType.DateTime,
            ),
            bookingDate: params.getParam(
              'bookingDate',
              ParamType.DateTime,
            ),
            bookingClientLocation: params.getParam(
              'bookingClientLocation',
              ParamType.LatLng,
            ),
            clientComment: params.getParam(
              'clientComment',
              ParamType.String,
            ),
            bookingPay: params.getParam(
              'bookingPay',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'ClientprofileEdit',
          path: '/clientprofileEdit',
          builder: (context, params) => const ClientprofileEditWidget(),
        ),
        FFRoute(
          name: 'hhh',
          path: '/hhh',
          builder: (context, params) => const HhhWidget(),
        ),
        FFRoute(
          name: 'testDialogs',
          path: '/testDialogs',
          builder: (context, params) => const TestDialogsWidget(),
        ),
        FFRoute(
          name: 'SPprofileEdit',
          path: '/sPprofileEdit',
          builder: (context, params) => const SPprofileEditWidget(),
        ),
        FFRoute(
          name: 'CreateAvailabilitySP2',
          path: '/createAvailabilitySP2',
          builder: (context, params) => CreateAvailabilitySP2Widget(
            availability: params.getParam<AvailabilityStruct>(
              'availability',
              ParamType.DataStruct,
              isList: true,
              structBuilder: AvailabilityStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'YoutubeRequestPage',
          path: '/youtubeRequestPage',
          builder: (context, params) => YoutubeRequestPageWidget(
            spRef: params.getParam(
              'spRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
            sector: params.getParam(
              'sector',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.int,
            ),
            service: params.getParam(
              'service',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CreateAvailabilitySP2Copy',
          path: '/createAvailabilitySP2Copy',
          builder: (context, params) => CreateAvailabilitySP2CopyWidget(
            availability: params.getParam(
              'availability',
              ParamType.DataStruct,
              isList: false,
              structBuilder: AvailabilityStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'CreateAvailabilitySP2Copy2',
          path: '/createAvailabilitySP2Copy2',
          builder: (context, params) => CreateAvailabilitySP2Copy2Widget(
            availability: params.getParam<AvailabilityStruct>(
              'availability',
              ParamType.DataStruct,
              isList: true,
              structBuilder: AvailabilityStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'ClientlLoginpageCopyCopy',
          path: '/clientlLoginpageCopyCopy',
          builder: (context, params) => const ClientlLoginpageCopyCopyWidget(),
        ),
        FFRoute(
          name: 'SPprofileEditCopy',
          path: '/sPprofileEditCopy',
          builder: (context, params) => const SPprofileEditCopyWidget(),
        ),
        FFRoute(
          name: 'danah',
          path: '/danah',
          builder: (context, params) => const DanahWidget(),
        ),
        FFRoute(
          name: 'dupplogin',
          path: '/dupplogin',
          builder: (context, params) => const DupploginWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/clientlLoginpageCopy';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/IMG_2797-removebg-preview_2.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
