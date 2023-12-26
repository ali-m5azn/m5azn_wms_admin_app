import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(secondaryColor),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.0.h,
              ),
              Container(
                width: 20.0.w,
                height: 10.0.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Makes the container circular
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 3.5, // Border width
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0.h),
                child: Text(Languages.of(context)?.changePassword ?? ""),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0.h),
                      child: CustomTxtField(
                        hint: Languages.of(context)?.changeNewPassHint ??
                            '', //Empty
                        fieldTitle:
                            Languages.of(context)?.newPassword ?? '', //Empty
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    CustomTxtField(
                      hint: Languages.of(context)?.changeConfirmPassHint ??
                          '', //Empty
                      fieldTitle:
                          Languages.of(context)?.confirmPassword ?? '', //Empty
                      keyboardType: TextInputType.name,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                child: Buttons(
                    text: Languages.of(context)?.changePassword ?? "", //Empty
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
