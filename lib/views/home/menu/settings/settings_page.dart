import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ScreenTitle(title: Languages.of(context)?.settings ?? ''),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: settingsItemList.length,
                  itemBuilder: (context, index) {
                    return _menuItemCard(
                        title: '${settingsItemList[index].title}',
                        callBack: () {
                          if (index == 2 ||
                              index == 3 ||
                              index == 5 ||
                              index == 6 ||
                              index == 7) {
                            NavigationService.navigateTo('/featureEnable');
                          }
                        },
                        leadingIcon: settingsItemList[index].icons!);
                  }),
            )
          ],
        ),
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
      ),
    );
  }
}

class SettingItemModel {
  String? title;
  IconData? icons;

  SettingItemModel({this.title, this.icons});
}

List<SettingItemModel> settingsItemList = [
  SettingItemModel(title: "Warehouse", icons: Icons.warehouse),
  SettingItemModel(title: "Locations", icons: Icons.location_on),
  SettingItemModel(title: "Picking Path", icons: Icons.add_road),
  SettingItemModel(title: "Cities", icons: Icons.location_city),
  SettingItemModel(title: "3pl Management", icons: Icons.ac_unit),
  SettingItemModel(title: "Allocation Rules", icons: Icons.rule),
  SettingItemModel(title: "KPL Management", icons: Icons.attach_money),
  SettingItemModel(title: "Packing Material", icons: Icons.book),
  SettingItemModel(title: "Sms Settings", icons: Icons.sms_rounded),
  SettingItemModel(title: "sms Templates", icons: Icons.sms_sharp),
  SettingItemModel(title: "Mail Settings", icons: Icons.mail),
  SettingItemModel(title: "Email Templates", icons: Icons.email_outlined),
];
