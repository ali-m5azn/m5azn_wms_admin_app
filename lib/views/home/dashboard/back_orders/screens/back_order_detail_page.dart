import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class BackOrderDetailPage extends StatefulWidget {
  const BackOrderDetailPage({super.key});

  @override
  State<BackOrderDetailPage> createState() => _BackOrderDetailPageState();
}

class _BackOrderDetailPageState extends State<BackOrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context: context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.2.w),
          child: Column(
            children: [
              ScreenTitle(
                title: Languages.of(context)?.backOrders ?? '',
                showTrailingOptions: false,
              ),
              _buildInfoRow('${Languages.of(context)?.date}:', '2023-11-04'),
              const Divider(),
              _buildInfoRow('${Languages.of(context)?.sellers}:', '2023-11-04'),
              const Divider(),
              _buildInfoRow('${Languages.of(context)?.reference}:', 'SL_1128'),
              const Divider(),
              _buildInfoRow('${Languages.of(context)?.status}:', 'Unpaid'),
              const Divider(),
              _buildInfoRow('${Languages.of(context)?.grandTotal}:', '15.00'),
              const Divider(),
              _buildInfoRow('${Languages.of(context)?.paid}:', '0'),
              const Divider(),
              _buildInfoRow('${Languages.of(context)?.due}:', '15.00'),
              const Divider(),
              _buildInfoRow(
                  '${Languages.of(context)?.paymentStatus}:', 'Unpaid'),
            ],
          ),
        ));
  }

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
}
