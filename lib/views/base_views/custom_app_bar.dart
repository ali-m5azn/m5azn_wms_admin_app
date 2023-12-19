import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/main.dart';
import 'package:m5azn_app_wms/views/home/notifications_view.dart';
import 'package:m5azn_app_wms/views/home/recharge_wallet_view.dart';

PreferredSizeWidget customAppBar(
    {required BuildContext context,
    bool isRechargeWalletScreen = false,
    bool isNotificationScreen = false}) {
  bool canPop = Navigator.of(context).canPop();
  return AppBar(
    leading: canPop
        ? _buildBackButton()
        : _buildWalletIcon(
            isRechargeWalletScreen: isRechargeWalletScreen, context: context),
    actions: [
      if (canPop)
        _buildWalletIcon(
            isRechargeWalletScreen: isRechargeWalletScreen, context: context),
      IconButton(
        icon: Icon(
          FontAwesomeIcons.solidBell,
          color:
              isNotificationScreen ? const Color(secondaryColor) : Colors.black,
          size: 5.0.sp,
        ),
        onPressed: isNotificationScreen
            ? null
            : () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsView()),
                ),
      )
    ],
  );
}

Widget _buildWalletIcon(
        {bool isRechargeWalletScreen = false, required BuildContext context}) =>
    IconButton(
      icon: Icon(
        FontAwesomeIcons.wallet,
        color:
            isRechargeWalletScreen ? const Color(secondaryColor) : Colors.black,
        size: 5.0.sp,
      ),
      onPressed: isRechargeWalletScreen
          ? null
          : () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RechargeWalletView()),
              ),
    );

Widget _buildBackButton() => InkWell(
      onTap: () => Navigator.pop(navigate.currentContext!),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.8.w),
        width: 6.w,
        height: 6.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(secondaryColor),
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 4.0.sp,
        ),
      ),
    );
