import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenTitle(
              title: "Order Detail",
              showFilters: false,
            ),
            _orderDetailRow(title: "Date", data: "2023-11-04"),
            _orderDetailRow(title: "Reference", data: "SL_118"),
            _orderDetailRow(title: "Added by", data: "Demo User"),
            _orderDetailRow(title: "Warehouse", data: "15.00"),
            _orderDetailRow(title: "Status", data: "Pending"),
            _orderDetailRow(title: "Grand Total", data: "15.00"),
            _orderDetailRow(title: "Paid", data: "0.00"),
            _orderDetailRow(title: "Due", data: "15.00"),
            _orderDetailRow(title: "Payment Status", data: "Pending"),
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
