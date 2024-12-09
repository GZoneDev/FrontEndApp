import 'package:auto_route/auto_route.dart';
//import 'package:receptico/features/auth/auth.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: StartRoute.page, path: '/'),
        // AutoRoute(page: LoginRoute.page),
        // AutoRoute(page: RegisterRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
