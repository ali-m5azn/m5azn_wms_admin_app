import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/consts/local_storage.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/menu/profile/controller/profile_controller.dart';
import 'package:m5azn_app_wms/views/widgets/button.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';
import 'package:m5azn_app_wms/views/widgets/txt_fields.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController userCon = TextEditingController();
  TextEditingController firstCon = TextEditingController();
  TextEditingController lastCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailCon.text = LocalStorage.readStorage(LocalStorage.email);
    passCon.text = LocalStorage.readStorage(LocalStorage.password);
    userCon.text = LocalStorage.readStorage(LocalStorage.userName);
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Camera'),
                onTap: () {
                  ref.watch(profileProvider).pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Gallery'),
                onTap: () {
                  ref.watch(profileProvider).pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Consumer(builder: (context, ref, widget) {
        final profileController = ref.watch(profileProvider.notifier);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.2.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenTitle(
                  title: Languages.of(context)?.profile ?? '',
                  showTrailingOptions: false,
                ),
                GestureDetector(
                  onTap: () {
                    _showImagePickerDialog(context);
                  },
                  child: Center(
                    child: CircleAvatar(
                      radius: 10.h,
                      backgroundColor: Color(secondaryColor),
                      backgroundImage: profileController.image != null
                          ? FileImage(profileController.image!)
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTxtField(
                  borderRadius: 1.5.w,
                  fieldTitle: Languages.of(context)?.firstName,
                  textInputAction: TextInputAction.next,
                  txtController: firstCon,
                  hint: Languages.of(context)?.firstName,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTxtField(
                  borderRadius: 1.5.w,
                  fieldTitle: Languages.of(context)?.lastName,
                  textInputAction: TextInputAction.next,
                  txtController: lastCon,
                  hint: Languages.of(context)?.lastName,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTxtField(
                  borderRadius: 1.5.w,
                  fieldTitle: Languages.of(context)?.name ?? '',
                  textInputAction: TextInputAction.next,
                  txtController: userCon,
                  hint: Languages.of(context)?.name ?? '',
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTxtField(
                  borderRadius: 1.5.w,
                  fieldTitle: Languages.of(context)?.phoneNumber ?? '',
                  textInputAction: TextInputAction.next,
                  txtController: phoneCon,
                  hint: Languages.of(context)?.phoneNumber ?? '',
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTxtField(
                  borderRadius: 1.5.w,
                  fieldTitle: Languages.of(context)?.email ?? '',
                  textInputAction: TextInputAction.next,
                  txtController: emailCon,
                  hint: Languages.of(context)?.email ?? '',
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTxtField(
                  borderRadius: 1.5.w,
                  fieldTitle: Languages.of(context)?.newPassword ?? '',
                  textInputAction: TextInputAction.next,
                  txtController: passCon,
                  hint: Languages.of(context)?.newPassword ?? '',
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
                      text: Languages.of(context)?.updateProfile ?? ''),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
