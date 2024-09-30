import 'package:get/get.dart';
import 'package:trakyo_admin/screens/_bindings/dashboard_binding.dart';
import 'package:trakyo_admin/screens/_bindings/login_binding.dart';
import 'package:trakyo_admin/screens/dashboard/dashboard_screen.dart';
import 'package:trakyo_admin/screens/login/login_screen.dart';

class Routes {
  Routes._();
  static const login = '/login';
  static const dashboard = '/dashboard';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        binding: LoginBindings()),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBindings(),
    ),
  ];
}
