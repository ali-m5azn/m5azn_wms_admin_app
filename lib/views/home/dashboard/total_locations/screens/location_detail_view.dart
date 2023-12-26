import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
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
            ScreenTitle(
              title: Languages.of(context)?.locationDetail ?? '',
              showFilters: false,
            ),
            _locationDetailRow(
                title: Languages.of(context)?.date ?? '', data: "2023-11-04"),
            _locationDetailRow(
                title: Languages.of(context)?.locationCode ?? '',
                data: "RUH2-3-4-5"),
            _locationDetailRow(
                title: Languages.of(context)?.locationType ?? '',
                data: "Goods location"),
            _locationDetailRow(
                title: Languages.of(context)?.productNos ?? '', data: "0"),
            _locationDetailRow(
                title: Languages.of(context)?.receivedOrders ?? '', data: "0"),
            _locationDetailRow(
                title: Languages.of(context)?.warehouse ?? '', data: "Riyadh"),
            _locationDetailRow(
                title: Languages.of(context)?.status ?? '', data: "0"),
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
