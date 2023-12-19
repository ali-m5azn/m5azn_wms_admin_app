import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/views/home/menu/reporting/reporting_view.dart';
import 'package:m5azn_app_wms/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(70.6, 146.6), // IPHONE 15 PRO MAX resolution
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'M5AZN WMS', //Empty
          navigatorKey: navigate,
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const SplashView(),
        );
      },
    );
  }
}

//Global key for context
GlobalKey<NavigatorState> navigate = GlobalKey<NavigatorState>();
