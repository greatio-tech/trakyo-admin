import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/dashboard/dashboard_screen.dart';

void main() {
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
        initialRoute: '/dashboard',
        routes: {
          '/dashboard': (context) => const DashboardScreen(),
        },
        // home: const DashboardScreen(),
      ),
    );
  }
}
