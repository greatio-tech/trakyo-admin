import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/screens/_bindings/dashboard_binding.dart';
import 'package:trakyo_admin/screens/_bindings/login_binding.dart';
import 'package:trakyo_admin/screens/dashboard/dashboard_screen.dart';
import 'package:trakyo_admin/screens/login/controller/login_controller.dart';
import 'package:trakyo_admin/screens/login/login_screen.dart';

class Routes {
  Routes._();
  static const login = '/login';
  static const dashboard = '/';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBindings(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
  ];
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print("route -- $route - ${LoginController.to.isAuthenticated.value}");

    if (!LoginController.to.isAuthenticated.value && route != Routes.login) {
      return const RouteSettings(name: Routes.login);
    }
    return null;
  }
}

// class RouteMiddleware extends GetMiddleware {
//   @override
//   RouteSettings? redirect(String? route) {
//     return LoginController.to.isAuthenticated.value
//         ? null // Allow access to the route
//         : const RouteSettings(
//             name: Routes.login,
//           ); // Redirect to login if not authenticated
//   }
// }
