import 'package:m5azn_app_wms/consts/assets.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/auth/login_view.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/splash_view';

  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  String? appVersion;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _init() async {
    await setAppVersion();
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      //Navigate to login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }

  setAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(secondaryColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              width: 100.0.w,
            ),
            if (appVersion != null)
              Text(
                "Version: $appVersion",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
