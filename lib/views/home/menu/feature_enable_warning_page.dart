import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';

class FeatureEnablePage extends StatelessWidget {
  const FeatureEnablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please contact your account manager to enable this feature',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 4.0.sp),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Buttons(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/${Languages.of(context)?.main}', (route) => false);
            },
            radius: 20,
            width: 50.0.w,
            color: const Color(secondaryColor),
            text: 'Go back to homepage',
          )
        ],
      ),
    );
  }
}
