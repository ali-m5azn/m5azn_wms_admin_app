import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m5azn_app_wms/consts/local_storage.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/home/controller/locale_controller.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class MenuView extends ConsumerWidget {
  final List<String> languagesList = ['English', 'Arabic'];

  MenuView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeProviderData = ref.watch(localeProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenTitle(
            title: Languages.of(context)?.menu ?? '',
            showTrailingOptions: false,
          ),
          _menuItemCard(
            title: Languages.of(context)?.profile ?? '',
            leadingIcon: FontAwesomeIcons.user,
            callBack: () => NavigationService.navigateTo(
                '/${Languages.of(context)?.profile}'),
          ),
          _menuItemCard(
            title: Languages.of(context)?.reports ?? '',
            leadingIcon: FontAwesomeIcons.file,
            callBack: () => NavigationService.navigateTo(
                '/${Languages.of(context)?.reports}'),
          ),
          _menuItemCard(
              title: Languages.of(context)?.subscription ?? '',
              leadingIcon: FontAwesomeIcons.moneyBill,
              callBack: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const SubscriptionPage()),
                // );
                NavigationService.navigateTo(
                    '/${Languages.of(context)?.subscription}');
              }),
          _menuItemCard(
              title: Languages.of(context)?.settings ?? '',
              leadingIcon: FontAwesomeIcons.gear,
              callBack: () {
                NavigationService.navigateTo(
                    '/${Languages.of(context)?.settings}');
              }),
          Card(
            margin: EdgeInsets.only(bottom: 5.0.h),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(Languages.of(context)?.languages ?? ''),
              trailing: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  var lanValue =
                      ref.watch(localeProvider.notifier).languageCode;
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: lanValue == 'en' ? 'English' : 'Arabic',
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        // _changeLanguage(context, newValue);
                        localeProviderData
                            .setLocale(newValue == 'English' ? 'en' : 'ar');
                        //setState(() {});
                      },
                      items: languagesList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ),
          _menuItemCard(
              title: Languages.of(context)?.logout ?? '',
              leadingIcon: Icons.logout,
              callBack: () {
                LocalStorage.eraseStorage();
                Navigator.pushNamedAndRemoveUntil(context,
                    '/${Languages.of(context)?.logIn}', (route) => false);
              }),
          // Dropdown,
        ],
      ),
    );
  }

  Widget _menuItemCard({
    required String title,
    required IconData leadingIcon,
    required GestureTapCallback callBack,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 5.0.h),
      child: ListTile(
        onTap: callBack,
        leading: Icon(
          leadingIcon,
          // color: const Color(secondaryColor),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 3.0.sp),
        ),
        trailing: Container(
          margin: EdgeInsets.symmetric(horizontal: 1.8.w),
          width: 5.5.w,
          height: 5.5.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: Color(secondaryColor),
          ),
          child: Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 3.5.sp,
          ),
        ),
      ),
    );
  }
}
