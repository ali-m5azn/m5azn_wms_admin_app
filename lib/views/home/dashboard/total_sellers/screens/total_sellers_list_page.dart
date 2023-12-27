import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/model/total_seller_model.dart';
import 'package:m5azn_app_wms/views/widgets/excel_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class TotalSellersListPage extends StatefulWidget {
  const TotalSellersListPage({super.key});

  @override
  State<TotalSellersListPage> createState() => _TotalSellersListPageState();
}

class _TotalSellersListPageState extends State<TotalSellersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenTitle(
              title: Languages.of(context)?.totalSellers ?? '',
              excelCallback: () => generateSellerExcel(
                  sellerLabel, totalSellerList, 'seller_invoice.xlsx'),
              pdfClickCallback: () => generateSellerPDF(),
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
          NavigationService.navigateTo('/sellerDetails');
        },
        title: Text(
          "zyros",
          style: TextStyle(fontSize: 3.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          "1012165485",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4.w,
          children: [
            Text(
              "pending",
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
