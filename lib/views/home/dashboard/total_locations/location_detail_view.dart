import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class LocationDetailView extends StatelessWidget {
  const LocationDetailView({super.key});

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
              title: "Location Detail",
              showFilters: false,
            ),
            _locationDetailRow(title: "Date", data: "2023-11-04"),
            _locationDetailRow(title: "Location code", data: "RUH2-3-4-5"),
            _locationDetailRow(title: "Location type", data: "Goods location"),
            _locationDetailRow(title: "No of products", data: "0"),
            _locationDetailRow(title: "Received orders", data: "0"),
            _locationDetailRow(title: "Warehouse", data: "Riyadh"),
            _locationDetailRow(title: "Status", data: "0"),
          ],
        ),
      ),
    );
  }

  Widget _locationDetailRow({required String title, required String data}) {
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
