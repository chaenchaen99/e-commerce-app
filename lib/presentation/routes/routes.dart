import '../pages/home/home_page.dart';
import '../pages/splash/splash_page.dart';
import 'routes_name.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/splash',
      name: RoutesName.SPLASH,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: '/home',
      name: RoutesName.HOME,
      builder: (context, state) => HomePage(),
    ),
  ],
  initialLocation: "/splash",
);
