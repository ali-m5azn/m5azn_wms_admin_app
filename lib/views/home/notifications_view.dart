import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, isNotificationScreen: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 5.0.h),
            child: Text(
              Languages.of(context)?.notifications ?? '', //Empty
              style: TextStyle(
                // color: const Color(secondaryColor),
                fontSize: 4.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (_, index) => _notificationsCard(
                title: "New message received", //Empty
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notificationsCard({required String title}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.0.w),
      child: Card(
        elevation: 2.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.0.h),
          child: ListTile(
            leading: Column(
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 2.5.sp,
                    fontWeight: FontWeight.bold,
                    //color: const Color(secondaryColor)
                  ),
                ),
                Text(
                  "10/09/2023",
                  style:
                      TextStyle(fontSize: 2.0.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
            horizontalTitleGap: 5.0.w,
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
