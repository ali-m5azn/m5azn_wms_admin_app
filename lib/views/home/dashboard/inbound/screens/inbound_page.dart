import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class InboundPage extends StatelessWidget {
  const InboundPage({Key? key}) : super(key: key);

  Widget _buildInfoRow(String label, String value) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
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
            ScreenTitle(
              title: Languages.of(context)?.inbound ?? '',
              showFilters: false,
              showTrailingOptions: false,
            ),
            _buildInfoRow('${Languages.of(context)?.date}:', '2023-11-04'),
            const Divider(),
            _buildInfoRow('${Languages.of(context)?.type}:', 'DN'),
            const Divider(),
            _buildInfoRow('Putaway Batch:', 'QT-1172'),
            const Divider(),
            _buildInfoRow('Seller:', 'Test Seller'),
            const Divider(),
            _buildInfoRow('Total SKUs:', '1'),
            const Divider(),
            _buildInfoRow('Total Qty:', '10'),
            const Divider(),
            _buildInfoRow('Operator:', 'Demo User'),
            const Divider(),
            _buildInfoRow('Completed:', '10'),
            const Divider(),
            _buildInfoRow('Hrs to be Completed:', ''),
            const Divider(),
            _buildInfoRow('${Languages.of(context)?.status}:', 'Completed'),
            const Divider(),
            _buildInfoRow('${Languages.of(context)?.action}:', 'Unpaid'),
          ],
        ),
      ),
    );
  }
}
