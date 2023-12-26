import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/assets.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/local_storage.dart';
import 'package:m5azn_app_wms/views/auth/screens/login_view.dart';
import 'package:m5azn_app_wms/views/home/main_view.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  Future<void> _init() async {
    await setAppVersion();
    await Future.delayed(const Duration(seconds: 3));
    final email = LocalStorage.readStorage(LocalStorage.email);
    print('this is >> $email');
    _navigateToNextScreen(email);
  }

  setAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  void _navigateToNextScreen(String? email) {
    final Widget nextScreen = email != null && email.isNotEmpty
        ? const MainView()
        : const LoginView();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
      (route) => false,
    );
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
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
