import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/shipping_orders_page/controller/shipping_order_controller.dart';
import 'package:m5azn_app_wms/views/home/dashboard/shipping_orders_page/model/shipping_orders_model.dart';
import 'package:m5azn_app_wms/views/widgets/excel_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_shipping_orders_widget.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class ShippingOrdersListPage extends ConsumerStatefulWidget {
  const ShippingOrdersListPage({super.key});

  @override
  ConsumerState<ShippingOrdersListPage> createState() =>
      _ShippingOrdersListPageState();
}

class _ShippingOrdersListPageState
    extends ConsumerState<ShippingOrdersListPage> {
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
              title: Languages.of(context)?.shippingOrders ?? '',
              pdfClickCallback: () => generateShippingPDF(),
              excelCallback: () => generateSellerExcel(shippingOrderLabel,
                  shippingOrderList, 'shipping_orders_invoice.xlsx'),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: shippingOrderList.length,
                itemBuilder: (_, index) => _shippingOrdersCard(context, index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _shippingOrdersCard(BuildContext context, int index) {
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
        title: Text(
          shippingOrderList[index].sale_ref ?? '',
          style: TextStyle(fontSize: 2.3.sp, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          shippingOrderList[index].warehouse ?? '',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 2.w,
          children: [
            Text(
              shippingOrderList[index].status ?? '',
              style: TextStyle(fontSize: 2.5.sp, fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                ref
                    .watch(shippingOrderController.notifier)
                    .selectShippingOrder(shippingOrderList[index]);
                NavigationService.navigateTo('/shippingOrderDetail');
              },
              child: Container(
                //   margin: EdgeInsets.symmetric(horizontal: 1.8.w),
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
          ],
        ),
      ),
    );
  }
}
