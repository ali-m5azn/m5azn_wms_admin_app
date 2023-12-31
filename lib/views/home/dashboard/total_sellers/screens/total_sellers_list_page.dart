import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/controller/total_sellers_controller.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/model/total_seller_model.dart';
import 'package:m5azn_app_wms/views/widgets/excel_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class TotalSellersListPage extends ConsumerStatefulWidget {
  const TotalSellersListPage({super.key});

  @override
  ConsumerState<TotalSellersListPage> createState() =>
      _TotalSellersListPageState();
}

class _TotalSellersListPageState extends ConsumerState<TotalSellersListPage> {
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
                itemCount: totalSellerList.length,
                itemBuilder: (_, index) => _locationCard(context, index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationCard(BuildContext context, int index) {
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
          ref
              .watch(totalSellersController.notifier)
              .selectTotalSeller(totalSellerList[index]);
          NavigationService.navigateTo('/sellerDetails');
        },
        title: Text(
          totalSellerList[index].shopName ?? '',
          style: TextStyle(fontSize: 3.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          totalSellerList[index].vat ?? '',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Container(
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
      ),
    );
  }
}
