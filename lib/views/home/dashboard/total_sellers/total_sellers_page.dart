import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class TotalSellersPage extends StatelessWidget {
  const TotalSellersPage({super.key});

  Widget _buildDetailRow(String label, String value) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }

  Widget _buildStatusRow(String label, bool isActive) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          CircleAvatar(
            backgroundColor: isActive ? Colors.green : Colors.grey,
          ),
        ],
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
            ScreenTitle(title: Languages.of(context)?.totalSellers ?? ''),
            _buildDetailRow('Shopname:', 'Zyros'),
            const Divider(),
            _buildDetailRow('Cr Name:', 'Abddfsid'),
            const Divider(),
            _buildDetailRow('Cr:', '36547372'),
            const Divider(),
            _buildDetailRow('Vat:', '7467337847'),
            const Divider(),
            _buildDetailRow('accountManger:', 'علي'),
            const Divider(),
            _buildDetailRow('Phone:', '05973625425'),
            const Divider(),
            _buildDetailRow(
                '${Languages.of(context)?.email}:', 'sgsdgt@gmaile.com'),
            const Divider(),
            _buildStatusRow('${Languages.of(context)?.status}:', true),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
