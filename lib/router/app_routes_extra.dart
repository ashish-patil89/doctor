import 'app_router.dart';

class AppBaseRouteArgs extends AppRouteExtra {
  const AppBaseRouteArgs();

  @override
  Map<String, dynamic> toAnalyticsJson() {
    return {
      'Publication Id': '',
    };
  }
}
