import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cerdastani/routes/routes.dart';

import '../features/authentication/login/presentation/pages/login_page.dart';


class AppRoutes {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: CTRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );

}
