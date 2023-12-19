import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitle(
                title: "Profile",
                showTrailingOptions: false,
              ),
              Container(
                height: 20.h,
                decoration: const BoxDecoration(
                    color: Color(secondaryColor), shape: BoxShape.circle),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTxtField(
                borderRadius: 1.5.w,
                fieldTitle: "Name",
                textInputAction: TextInputAction.next,
                txtController: TextEditingController(),
                hint: "Name",
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTxtField(
                borderRadius: 1.5.w,
                fieldTitle: "Phone Number",
                textInputAction: TextInputAction.next,
                txtController: TextEditingController(),
                hint: "Phone Number",
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTxtField(
                borderRadius: 1.5.w,
                fieldTitle: "Email",
                textInputAction: TextInputAction.next,
                txtController: TextEditingController(),
                hint: "Email",
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTxtField(
                borderRadius: 1.5.w,
                fieldTitle: "Address",
                maxLines: 3,
                textInputAction: TextInputAction.next,
                txtController: TextEditingController(),
                hint: "Address",
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Buttons(
                    color: const Color(secondaryColor),
                    radius: 1.5.w,
                    txtFontSize: 2.0.sp,
                    width: 30.w,
                    onPressed: () {},
                    text: "Update Profile"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
