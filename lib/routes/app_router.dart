import 'package:Weather/routes/app_router_names.dart';
import 'package:Weather/view/screens/forecast_screen.dart';
import 'package:Weather/view/screens/home_screen.dart';
import 'package:Weather/view/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouterNames.home,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRouterNames.home,
        name: AppRouterNames.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRouterNames.forecast,
        name: AppRouterNames.forecast,
        builder: (context, state) => ForecastScreen(),
      ),
      GoRoute(
        path: AppRouterNames.search,
        name: AppRouterNames.search,
        builder: (context, state) => SearchScreen(),
      ),
    ],
  );
}
