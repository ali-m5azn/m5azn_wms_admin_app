import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/controller/total_order_controller.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/model/sale_item_model.dart';
import 'package:m5azn_app_wms/views/widgets/excel_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_sale_widget.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class TotalOrdersListView extends ConsumerStatefulWidget {
  const TotalOrdersListView({super.key});

  @override
  ConsumerState<TotalOrdersListView> createState() =>
      _TotalOrdersListViewState();
}

class _TotalOrdersListViewState extends ConsumerState<TotalOrdersListView> {
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
                title: Languages.of(context)?.totalOrders ?? '',
                pdfClickCallback: () => generateOrderPDF(),
                excelCallback: () => generateSellerExcel(
                    saleLabelItem, saleItemList, 'sale_invoice.xlsx')),
            Flexible(
              child: ListView.builder(
                itemCount: saleItemList.length,
                itemBuilder: (_, index) => _runSheetCard(context, index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _runSheetCard(BuildContext context, int index) {
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
              .watch(totalOrderController.notifier)
              .selectTotalSeller(saleItemList[index]);
          NavigationService.navigateTo(
              '/${Languages.of(context)?.orderDetail}');
        },
        title: Text(
          saleItemList[index].ref ?? '',
          style: TextStyle(fontSize: 3.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          saleItemList[index].createdAt ?? '',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4.w,
          children: [
            Text(
              saleItemList[index].shippingStatus ?? '',
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
