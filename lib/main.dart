import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/dashboard/dashboard_screen.dart';
import 'package:trakyo_admin/screens/login/login_screen.dart';
import 'package:trakyo_admin/screens/qr_design.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize:
          // ResponsiveWidget.isSmallScreen(context)
          //     ? const Size(390, 844)
          //     :
          const Size(1440, 1024),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            background: AppColors.backgroundColor,
          ),
          useMaterial3: true,
        ),
        title: 'Trakyo admin',
        initialRoute: '/login',
        routes: {
          '/dashboard': (context) => const DashboardScreen(),
          '/login': (context) => const LoginScreen(),
        },
        // home: const QrDesign(
        //     qrUrl:
        //         'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/800px-QR_code_for_mobile_English_Wikipedia.svg.png'),
      ),
    );
  }
}
