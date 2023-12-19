import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/auth/reset_password_view.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String routeName = '/forgot_password_view';

  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailTxtController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(secondaryColor),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.0.w,
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
                padding: EdgeInsets.symmetric(vertical: 5.0.h),
                child: const Text("Recover Password"), //Empty
              ),
              Form(
                key: formKey,
                child: CustomTxtField(
                  txtController: emailTxtController,
                  fieldTitle: "Email", //Empty
                  hint: "Please enter email", //Empty
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                child: Buttons(
                    text: "Send Password Reset Email", //Empty
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordView()),
                        );
                      }
                    }),
              ),
              Buttons(
                  color: const Color(secondaryColor).withOpacity(0.1),
                  text: "Back to log in", //Empty
                  onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
