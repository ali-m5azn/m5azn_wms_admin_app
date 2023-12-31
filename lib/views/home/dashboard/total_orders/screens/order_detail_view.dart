import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/controller/total_order_controller.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/model/sale_item_model.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class OrderDetailView extends ConsumerWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SaleItemModel totalSellerModel =
        ref.watch(totalOrderController).saleItemModel;
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenTitle(
              title: Languages.of(context)?.orderDetail ?? '',
              showTrailingOptions: false,
            ),
            _orderDetailRow(
                title: Languages.of(context)?.date ?? '',
                data: totalSellerModel.createdAt ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.reference ?? '',
                data: totalSellerModel.ref ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.addedBy ?? '',
                data: totalSellerModel.createdBy ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.warehouse ?? '',
                data: totalSellerModel.warehouse ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.status ?? '',
                data: totalSellerModel.status ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.grandTotal ?? '',
                data: totalSellerModel.total ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.paid ?? '',
                data: totalSellerModel.shippingStatus ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.due ?? '',
                data: totalSellerModel.due ?? ''),
            _orderDetailRow(
                title: Languages.of(context)?.paymentStatus ?? '',
                data: totalSellerModel.paymentStatus ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _orderDetailRow({required String title, required String data}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 2.6.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Text(
                data,
                style: TextStyle(fontSize: 2.6.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(
            thickness: 0.15.h,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
