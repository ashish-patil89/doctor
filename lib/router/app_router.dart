import 'dart:async';
import 'dart:developer';

import 'package:doctor/home/view/home_page.dart';
import 'package:doctor/login/view/login_page.dart';
import 'package:doctor/set_schedule/set_schedule.dart';
import 'package:doctor/signup/view/signup_page.dart';
import 'package:doctor/splash/splash.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../app/view/app_base.dart';

part 'app_routes.dart';

class AppRouter {
  AppRouter({
    GoRouter? goRouter,
    List<NavigatorObserver> navigatorObservers = const [],
  }) : _goRouter = goRouter ??
            _initializeGoRouter(
              navigatorObservers,
            );

  final GoRouter _goRouter;

  /// Pushes an [AppRoute] route on top of the current navigation stack.
  ///
  /// Example routes:
  /// * [AppBaseRoute]
  Future<TObject?> push<TObject extends Object?>(AppRoute appRoute) {
    final path = appRoute.path;
    final data = appRoute.extra;

    return _goRouter.push<TObject>(
      path,
      extra: data,
    );
  }

  /// Replaces an [AppRoute] route on top of the current navigation stack.
  ///
  /// Example routes:
  /// * [AppBaseRoute]
  Future<void> pushReplacement(AppRoute appRoute) {
    final path = appRoute.path;
    final data = appRoute.extra;

    return _goRouter.pushReplacement(
      path,
      extra: data,
    );
  }

  /// Clears the navigation stack and pushes an [AppRoute] route.
  ///
  /// Example routes:
  /// * [AppBaseRoute]
  void go(AppRoute appRoute) {
    final path = appRoute.path;
    final data = appRoute.extra;

    _goRouter.go(
      path,
      extra: data,
    );
  }

  /// Clears the navigation stack and pushes a route from [path].
  void goNamed(String path) {
    _goRouter.go(
      path,
    );
  }

  /// Pops the top page off the router page stack.
  void pop([Object? result]) {
    _goRouter.pop(result);
  }

  /// Pops the top page off the router page stack
  /// until the [routeName] is reached.
  void popUntil(String routeName, {Object? result}) {
    while (_goRouter.canPop() &&
        routerDelegate.currentConfiguration?.last.route.name != routeName) {
      pop(result);
    }
  }

  /// Returns `true` if there is at least two or more route can be pop.
  bool canPop() => _goRouter.canPop();

  /// Expose the [RouterDelegate] of the underlying [GoRouter].
  RouterDelegate<RouteMatchList> get routerDelegate => _goRouter.routerDelegate;

  /// Expose the [RouteInformationParser] of the underlying [GoRouter].
  RouteInformationParser<Object> get routeInformationParser =>
      _goRouter.routeInformationParser;

  RouteInformationProvider get routeInformationProvider =>
      _goRouter.routeInformationProvider;

  static AppRouter of(BuildContext context) => context.read<AppRouter>();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static GoRouter _initializeGoRouter(
    List<NavigatorObserver> navigatorObservers,
  ) {
    final initialLocationAndExtra = getInitialLocationAndExtra();

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocationAndExtra.routePath,
      initialExtra: initialLocationAndExtra.routeExtra,
      observers: navigatorObservers,
      redirect: _redirect,
      routes: _appRoutes,
      onException: (context, state, router) {
        const name = 'AppRouter';
        final message = 'Exception occurred while navigating to a route. '
            'Invalid route: ${state.uri}';

        log(message, name: name);
      },

      /// When user taps on a deep link, we don't want the initial route to
      /// be set by the platform. We want to set the initial route to either
      /// the home page if user is authenticated or the user profile page if
      /// not.
      ///
      /// The deep link route that the app was opened with will be handled
      /// via [DeepLinksCubit] and [DeepLinksListener] and it will be pushed
      /// on top of the current navigation stack so that the user can go back
      /// to the previous route.
      overridePlatformDefaultLocation: true,
    );
  }

  static ({String routePath, Object? routeExtra}) getInitialLocationAndExtra() {
    //TODO(Ashish): Add check for user is logged in.
    final isLoggedIn = false;

    if (isLoggedIn) {
      log(
        'Showing AppBaseRoute as initial location '
        'as the user is logged in, whitelisted and has completed onboarding.',
        name: 'AppRouter',
      );

      return (
        routePath: AppBaseRoute.route.path,
        routeExtra: null,
      );
    }

    log(
      'Showing Login as initial location '
      'as the user is not logged in or is not allowed.',
      name: 'AppRouter',
    );

    return (
      routePath: SplashRoute.route.path,
      routeExtra: null,
    );
  }

  static FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    /// This is a workaround to prevent the go router from navigating to the
    /// deep link route.
    ///
    /// There are 2 main reasons for this:
    /// 1. The deep link route does not correspond to a valid route in the app.
    ///    For instance, the deep link to user profile page is `/@andrea`, but
    ///    the actual route is `/user_profile_details/:id`. When go router tries
    ///    to navigate to `/@andrea`, it will fail because it does not exist and
    ///    it will display an error page.
    ///
    ///    Related issue:
    ///    * https://github.com/flutter/flutter/issues/103659
    ///
    /// 2. It seems that go router doesn't support redirecting to a route in a
    ///    way that it is pushed on top of the current navigation stack. This
    ///    means that user is on the home page and clicks on a deep link to a
    ///    user profile, the home page will be replaced with the user profile
    ///    page and user will not be able to go back to the home page.
    ///
    ///    Related issue:
    ///    * https://github.com/flutter/flutter/issues/114131
    ///
    /// Throwing an exception here prevents the go router from navigating
    /// to the deep link route. The actual deep link handling is done in
    /// the [DeepLinksCubit] and the [DeepLinksListener].
    ///
    /// The exception that is thrown in this process is not being reported to
    /// Sentry to avoid spamming the dashboard with irrelevant errors. It is
    /// caught in the [bootstrap] method.
    /*final isDeepLink = context.read<DeepLinksCubit>().isDeepLink(state.uri);
    log('isDeepLink: $isDeepLink, uri: ${state.uri}', name: 'AppRouter');
    if (isDeepLink) {
      throw const UnsupportedDeepLinkRouteException();
    }*/

    return null;
  }

  /// This method will dispose of all the injected streams.
  void dispose() {}
}

class UnsupportedDeepLinkRouteException implements Exception {
  const UnsupportedDeepLinkRouteException();
}
