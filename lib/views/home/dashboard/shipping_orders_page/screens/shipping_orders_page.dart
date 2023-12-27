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
            ScreenTitle(
              title: Languages.of(context)?.shippingOrders ?? '',
              showFilters: false,
            ),
            _buildRowItem(Languages.of(context)?.date ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.saleRef ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.customer ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.warehouse ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.status ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.action ?? ''),
            const Divider(),
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
          Text('$label :'),
          // You can add additional widgets here if needed
        ],
      ),
    );
  }
}
