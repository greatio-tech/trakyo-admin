import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/theme.dart';
import 'package:trakyo_admin/routes.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(LoginController());
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
        theme: AppTheme.theme,
        title: 'Trakyo admin',
        getPages: AppPages.pages,
        initialRoute: Routes.login,
      ),
    );
  }
}
