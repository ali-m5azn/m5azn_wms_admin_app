import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/assets.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

import '../controllers/login_controller.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  late LoginController loginController;

  @override
  Widget build(BuildContext context) {
    loginController = ref.watch(loginControllerProvider.notifier);
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
                      CustomTxtField(
                        fieldTitle: Languages.of(context)?.email ?? '',
                        //Empty
                        hint: Languages.of(context)?.emailHint ?? '',
                        //Empty
                        keyboardType: TextInputType.emailAddress,
                        txtController: emailController,
                        validateInput: (value) => value!.isEmpty
                            ? Languages.of(context)?.emailHint ?? ''
                            : null,
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      CustomTxtField(
                        hint: Languages.of(context)?.passwordHint ?? '',
                        //Empty
                        fieldTitle: Languages.of(context)?.password ?? '',
                        //Empty
                        isHidden: _hidePassword,
                        txtController: passController,
                        keyboardType: TextInputType.visiblePassword,
                        validateInput: (value) => value!.isEmpty
                            ? Languages.of(context)?.passwordHint ?? ''
                            : null,
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
                          NavigationService.navigateTo(
                              '/${Languages.of(context)?.forgotPassword}')
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              Languages.of(context)?.forgotPassword ??
                                  '', //Empty
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Buttons(
                          text: Languages.of(context)?.signIn ?? '', //Empty
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              loginController.authenticate(context,
                                  emailController.text, passController.text);
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
