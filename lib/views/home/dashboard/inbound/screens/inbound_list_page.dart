import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class InboundListPage extends StatefulWidget {
  const InboundListPage({super.key});

  @override
  State<InboundListPage> createState() => _InboundListPageState();
}

class _InboundListPageState extends State<InboundListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          children: [
            ScreenTitle(
              title: Languages.of(context)?.inbound ?? '',
              showFilters: false,
              showTrailingOptions: false,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) => _runSheetCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _runSheetCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(
        //   color: Colors.black,
        //   width: 0.2.w,
        // ),
      ),
      child: ListTile(
        onTap: () {
          NavigationService.navigateTo(
              '/${Languages.of(context)?.inboundDetail}');
        },
        title: Text(
          "QT_1177",
          style: TextStyle(fontSize: 3.sp),
        ),
        subtitle: const Text(
          "15/03/2023",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 2.w,
          children: [
            Text(
              "Pending",
              style: TextStyle(fontSize: 2.5.sp, fontWeight: FontWeight.w500),
            ),
            Container(
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
