import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const Loginpage1Widget() : const LoginpageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const Loginpage1Widget()
              : const LoginpageWidget(),
        ),
        FFRoute(
          name: 'CreateAccountClient',
          path: '/CreateAccountClient',
          builder: (context, params) => CreateAccountClientWidget(
            place: params.getParam(
              'place',
              ParamType.LatLng,
            ),
            marker: params.getParam(
              'marker',
              ParamType.LatLng,
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
          name: 'createAccountSP',
          path: '/createAccountSP',
          builder: (context, params) => CreateAccountSPWidget(
            marker: params.getParam(
              'marker',
              ParamType.LatLng,
            ),
          ),
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
          name: 'loginpage',
          path: '/loginpage',
          builder: (context, params) => const LoginpageWidget(),
        ),
        FFRoute(
          name: 'errormsg',
          path: '/errormsg',
          builder: (context, params) => const ErrormsgWidget(),
        ),
        FFRoute(
          name: 'clientPinLocation',
          path: '/SPlocationfromHPCopy',
          builder: (context, params) => ClientPinLocationWidget(
            loc: params.getParam(
              'loc',
              ParamType.LatLng,
            ),
            doc: params.getParam(
              'doc',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['locations'],
            ),
            name: params.getParam(
              'name',
              ParamType.String,
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
            spRef: params.getParam(
              'spRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
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
            spRef: params.getParam(
              'spRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
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
          name: 'SPprofileEditCopy',
          path: '/sPprofileEditCopy',
          builder: (context, params) => const SPprofileEditCopyWidget(),
        ),
        FFRoute(
          name: 'chatPage',
          path: '/chatPage',
          builder: (context, params) => ChatPageWidget(
            receiveChat: params.getParam(
              'receiveChat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
            bookingID: params.getParam(
              'bookingID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CreateAccountClientCopy',
          path: '/updateAccountClient',
          builder: (context, params) => CreateAccountClientCopyWidget(
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
          name: 'clientLocation',
          path: '/clientLocation',
          builder: (context, params) => const ClientLocationWidget(),
        ),
        FFRoute(
          name: 'requestPageCopy2',
          path: '/requestPageCopy2',
          builder: (context, params) => const RequestPageCopy2Widget(),
        ),
        FFRoute(
          name: 'chatSPCopy',
          path: '/chatSPCopy',
          builder: (context, params) => ChatSPCopyWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'chatsClientCopy',
          path: '/chatsClientCopy',
          builder: (context, params) => ChatsClientCopyWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['booking'],
            ),
          ),
        ),
        FFRoute(
          name: 'ViewSPprofile',
          path: '/ViewSPprofile',
          asyncParams: {
            'parameterProfile': getDoc(['user'], UserRecord.fromSnapshot),
          },
          builder: (context, params) => ViewSPprofileWidget(
            parameterProfile: params.getParam(
              'parameterProfile',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Addpayment',
          path: '/Addpayment',
          builder: (context, params) => const AddpaymentWidget(),
        ),
        FFRoute(
          name: 'AddpaymentCopy',
          path: '/AddpaymentCopy',
          builder: (context, params) => const AddpaymentCopyWidget(),
        ),
        FFRoute(
          name: 'ViewSPprofileCopy',
          path: '/ViewSPprofileCopy',
          builder: (context, params) => ViewSPprofileCopyWidget(
            parameterProfile: params.getParam(
              'parameterProfile',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
            nameSP: params.getParam(
              'nameSP',
              ParamType.String,
            ),
            phoneNum: params.getParam(
              'phoneNum',
              ParamType.String,
            ),
            firstN: params.getParam(
              'firstN',
              ParamType.String,
            ),
            lName: params.getParam(
              'lName',
              ParamType.String,
            ),
            totalRate: params.getParam(
              'totalRate',
              ParamType.int,
            ),
            avgRate: params.getParam(
              'avgRate',
              ParamType.double,
            ),
            price: params.getParam(
              'price',
              ParamType.int,
            ),
            photo: params.getParam(
              'photo',
              ParamType.String,
            ),
            bio: params.getParam(
              'bio',
              ParamType.String,
            ),
            sector: params.getParam(
              'sector',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'loginpage1',
          path: '/loginpage1',
          builder: (context, params) => const Loginpage1Widget(),
        ),
        FFRoute(
          name: 'rateAndReviewPage',
          path: '/rateAndReviewPage',
          builder: (context, params) => RateAndReviewPageWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['booking'],
            ),
            spID: params.getParam(
              'spID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'SPReviewsPage',
          path: '/sPReviewsPage',
          builder: (context, params) => SPReviewsPageWidget(
            serviceProviderFname: params.getParam(
              'serviceProviderFname',
              ParamType.String,
            ),
            serviceProviderID: params.getParam(
              'serviceProviderID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
          ),
        ),
        FFRoute(
          name: 'SPReviewsPageCopy',
          path: '/sPReviewsPageCopy',
          builder: (context, params) => const SPReviewsPageCopyWidget(),
        ),
        FFRoute(
          name: 'searchClientNoFilterCopy',
          path: '/searchClientNoFilterCopy',
          builder: (context, params) => SearchClientNoFilterCopyWidget(
            filters: params.getParam(
              'filters',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SavedLocations',
          path: '/savedLocations',
          builder: (context, params) => const SavedLocationsWidget(),
        ),
        FFRoute(
          name: 'notifica',
          path: '/notifica',
          asyncParams: {
            'notification':
                getDoc(['notification'], NotificationRecord.fromSnapshot),
          },
          builder: (context, params) => NotificaWidget(
            notification: params.getParam(
              'notification',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'supportDoc',
          path: '/supportDoc',
          builder: (context, params) => const SupportDocWidget(),
        ),
        FFRoute(
          name: 'ClientHomePageCopy',
          path: '/clientHomePageCopy',
          builder: (context, params) => const ClientHomePageCopyWidget(),
        ),
        FFRoute(
          name: 'categories',
          path: '/categories',
          builder: (context, params) => CategoriesWidget(
            sector: params.getParam(
              'sector',
              ParamType.String,
            ),
          ),
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
            return '/loginpage';
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
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Image.asset(
                    'assets/images/IMG_2797-removebg-preview_2.png',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

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
