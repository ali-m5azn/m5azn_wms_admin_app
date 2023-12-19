import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/assets.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/auth/forgot_password_view.dart';
import 'package:m5azn_app_wms/views/home/main_view.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(secondaryColor),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 12.0.h,
                      ),
                      Image.asset(
                        AppAssets.logo,
                        fit: BoxFit.fitWidth,
                        width: 100.w,
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      const CustomTxtField(
                        fieldTitle: "Email", //Empty
                        hint: "Please enter email", //Empty
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      CustomTxtField(
                        hint: "Please enter password",
                        //Empty
                        fieldTitle: "Password",
                        //Empty
                        isHidden: _hidePassword,
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: InkWell(
                            onTap: () {
                              _hidePassword = !_hidePassword;
                              setState(() {});
                            },
                            child: Icon(
                              _hidePassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.black,
                            )),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordView()),
                          )
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0.h),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?", //Empty
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Buttons(
                          text: "Sign in", //Empty
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainView()),
                                (route) => false,
                              );
                            }
                          }),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
