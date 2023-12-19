import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/home/menu/profile/profile_view.dart';
import 'package:m5azn_app_wms/views/home/menu/reporting/reporting_view.dart';
import 'package:m5azn_app_wms/views/home/menu/wallet/wallet_list_view.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenTitle(
            title: "Menu",
            showTrailingOptions: false,
          ),
          _menuItemCard(
            title: "Profile",
            leadingIcon: FontAwesomeIcons.user,
            callBack: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileView()),
            ),
          ),
          _menuItemCard(
            title: "Reports",
            leadingIcon: FontAwesomeIcons.file,
            callBack: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ReportingView()),
            ),
          ),
          _menuItemCard(
              title: "Subscription",
              leadingIcon: FontAwesomeIcons.moneyBill,
              callBack: () {}),
          _menuItemCard(
              title: "Settings",
              leadingIcon: FontAwesomeIcons.gear,
              callBack: () {}),
          _menuItemCard(
            title: "Wallet",
            leadingIcon: FontAwesomeIcons.wallet,
            callBack: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WalletListView()),
            ),
          ),
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
          color: const Color(secondaryColor),
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
            color: Color(secondaryColor),
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
