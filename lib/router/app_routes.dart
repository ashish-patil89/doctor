part of 'app_router.dart';

final _appRoutes = <RouteBase>[
  AppBaseRoute.route,
  SignupRoute.route,
  LoginRoute.route,
  SplashRoute.route,
];

abstract class AppRoute extends Equatable {
  const AppRoute();

  AppRouteExtra? get extra => null;

  String get path;

  @override
  List<Object?> get props => [path, extra];
}

abstract class AppRouteExtra extends Object {
  const AppRouteExtra();

  /// Converts the route extra to a map that will be sent to analytics.
  Map<String, dynamic> toAnalyticsJson();
}

class AppBaseRoute extends AppRoute {
  const AppBaseRoute() : super();

  @override
  String get path => '/app_base';

  static GoRoute get route => GoRoute(
        path: '/app_base',
        name: 'AppBase',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          name: state.name,
          child: const AppBase(),
        ),
        parentNavigatorKey: AppRouter.rootNavigatorKey,
      );
}

class SignupRoute extends AppRoute {
  const SignupRoute() : super();

  @override
  String get path => '/signup';

  static GoRoute get route => GoRoute(
        path: '/signup',
        name: 'SignupPage',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          name: state.name,
          child: const SignupPage(),
        ),
        parentNavigatorKey: AppRouter.rootNavigatorKey,
      );
}

class LoginRoute extends AppRoute {
  const LoginRoute() : super();

  @override
  String get path => '/login';

  static GoRoute get route => GoRoute(
        path: '/login',
        name: 'LoginPage',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          name: state.name,
          child: const LoginPage(),
        ),
        parentNavigatorKey: AppRouter.rootNavigatorKey,
      );
}

class SplashRoute extends AppRoute {
  const SplashRoute() : super();

  @override
  String get path => '/splash';

  static GoRoute get route => GoRoute(
        path: '/splash',
        name: 'SplashPage',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          name: state.name,
          child: const SplashPage(),
        ),
        parentNavigatorKey: AppRouter.rootNavigatorKey,
      );
}
