import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

class ResetPasswordView extends StatelessWidget {
  static const String routeName = '/reset_password_view';

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
                child: Text("Change Password"),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0.h),
                      child: CustomTxtField(
                        hint: "Please enter new password", //Empty
                        fieldTitle: "New Password", //Empty
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    CustomTxtField(
                      hint: "Please enter confirm password", //Empty
                      fieldTitle: "Confirm New Password", //Empty
                      keyboardType: TextInputType.name,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                child: Buttons(
                    text: "Change Password", //Empty
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
