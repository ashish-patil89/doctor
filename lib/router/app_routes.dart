part of 'app_router.dart';

final _appRoutes = <RouteBase>[
  AppBaseRoute.route,
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
