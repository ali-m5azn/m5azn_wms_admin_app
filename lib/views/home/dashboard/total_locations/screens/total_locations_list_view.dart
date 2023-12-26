import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class TotalLocationsListView extends StatelessWidget {
  const TotalLocationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenTitle(title: Languages.of(context)?.allLocations ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryContainer(
                    "${Languages.of(context)?.allLocations}: 1000"),
                _buildSummaryContainer("Empty locations: 0"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) => _locationCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryContainer(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: 25.w,
      child: Padding(
        padding: EdgeInsets.all(2.sp),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 2.8.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _locationCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 0.2.w,
        ),
      ),
      child: ListTile(
        onTap: () {
          NavigationService.navigateTo(
              '/${Languages.of(context)?.locationDetail}');
        },
        title: Text(
          "Location !",
          style: TextStyle(fontSize: 3.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          "Total sku: 25",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4.w,
          children: [
            Text(
              "Total qty: 100",
              style: TextStyle(fontSize: 2.5.sp, fontWeight: FontWeight.w500),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 1.8.w),
              width: 6.w,
              height: 6.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 4.0.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
