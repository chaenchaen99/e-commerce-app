import '../pages/cart_list/cart_list_page.dart';
import '../pages/home/home_page.dart';
import '../pages/main/main_page.dart';
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
      path: '/main',
      name: RoutesName.MAIN,
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: '/home',
      name: RoutesName.HOME,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/cart-list',
      name: RoutesName.CART_LIST,
      builder: (context, state) => CartListPage(),
    ),
  ],
  initialLocation: '/splash',
);
