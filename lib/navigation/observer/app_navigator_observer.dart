import 'dart:async';
import 'dart:developer';

import 'package:doctor/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigatorObserver extends NavigatorObserver {
  final Map<Route<dynamic>, AppRouteExtra?> _routeExtras = {};

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('didPush route -> ${route.settings.name}');

    final currentRouteExtra = _currentRouteExtra(route);
    _routeExtras[route] = currentRouteExtra;

    final currentRouteName = route.settings.name;
    if (currentRouteName != null) {
      unawaited(
        _setCurrentScreen(
          screenName: currentRouteName,
          screenExtra: currentRouteExtra,
        ),
      );
    }

    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log('didReplace route -> ${oldRoute?.settings.name} '
        'with ${newRoute?.settings.name}');

    final currentRouteExtra = _currentRouteExtra(newRoute);

    if (oldRoute != null) {
      _routeExtras.remove(oldRoute);
    }

    if (newRoute != null) {
      _routeExtras[newRoute] = currentRouteExtra;
    }

    final newRouteName = newRoute?.settings.name;
    if (newRouteName != null) {
      unawaited(
        _setCurrentScreen(
          screenName: newRouteName,
          screenExtra: currentRouteExtra,
        ),
      );
    }

    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('didPop route -> ${route.settings.name}');

    _routeExtras.remove(route);

    final previousRouteName = previousRoute?.settings.name;
    if (previousRouteName != null) {
      final previousRouteExtra = _routeExtras[previousRoute];
      unawaited(
        _setCurrentScreen(
          screenName: previousRouteName,
          screenExtra: previousRouteExtra,
        ),
      );
    }

    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeExtras.remove(route);
    super.didRemove(route, previousRoute);
  }

  Future<void> _setCurrentScreen({
    required String screenName,
    required AppRouteExtra? screenExtra,
  }) async {
    final currentNavigator = navigator;

    if (currentNavigator != null) {
      await Future.wait([
        /*currentNavigator.context.read<OnboardingCubit>().setCurrentScreen(
              screenName: screenName,
              screenExtra: screenExtra,
            ),
        currentNavigator.context.read<AnalyticsCubit>().setCurrentScreen(
              screenName: screenName,
              screenProperties: screenExtra?.toAnalyticsJson() ?? {},
            ),*/
      ]);
    }
  }

  AppRouteExtra? _currentRouteExtra(Route<dynamic>? route) {
    final currentRouteState = _appRouter?.routeInformationProvider.value.state;
    final currentRouteExtra = currentRouteState is RouteInformationState &&
            currentRouteState.extra is AppRouteExtra
        ? currentRouteState.extra! as AppRouteExtra
        : null;

    if (currentRouteExtra != null) {
      return currentRouteExtra;
    }

    final routeArguments = route?.settings.arguments;
    if (routeArguments is AppRouteExtra) {
      return routeArguments;
    }

    return null;
  }

  AppRouter? get _appRouter {
    final context = AppRouter.rootNavigatorKey.currentContext;
    if (context == null) {
      return null;
    }
    return AppRouter.of(context);
  }
}
