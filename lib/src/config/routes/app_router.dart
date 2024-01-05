import 'package:auto_route/auto_route.dart';
import 'package:church_hub_mobile/src/config/routes/app_router.gr.dart';

/// App Router configuration
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
      ];
}
