import 'package:auto_route/auto_route.dart';
import 'package:weather_app/weather_app.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: WelcomeRoute.page, initial: true),
      ];
}
