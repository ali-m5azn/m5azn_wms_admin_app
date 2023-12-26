import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class ShippingOrdersPage extends StatelessWidget {
  const ShippingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          children: [
            ScreenTitle(title: Languages.of(context)?.shippingOrders ?? ''),
            _buildRowItem(Languages.of(context)?.date ?? ''),
            _buildRowItem(Languages.of(context)?.saleRef ?? ''),
            _buildRowItem(Languages.of(context)?.customer ?? ''),
            _buildRowItem(Languages.of(context)?.warehouse ?? ''),
            _buildRowItem(Languages.of(context)?.status ?? ''),
            _buildRowItem(Languages.of(context)?.action ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem(String label) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          // You can add additional widgets here if needed
        ],
      ),
    );
  }
}
