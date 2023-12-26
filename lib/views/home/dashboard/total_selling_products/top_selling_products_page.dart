import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class TopSellingProductsPage extends StatelessWidget {
  const TopSellingProductsPage({super.key});

  Widget _buildDetailRow(String label, String value) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          children: [
            ScreenTitle(title: Languages.of(context)?.topSellingProducts ?? ''),
            _buildDetailRow('${Languages.of(context)?.code}:', '29f948j'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.promoduct}:', 'Test'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.totalSales}:', 'SAR 14'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.totalAmount}:', 'SAR 14'),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
