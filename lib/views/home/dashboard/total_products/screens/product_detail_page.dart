import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  Widget _buildDetailRow(String label, String value) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }

  Widget _buildDetailRowImg(String label, IconData value) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Icon(value)],
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
                title: Languages.of(context)?.productDetail ?? '',
                showTrailingOptions: false),
            _buildDetailRowImg('${Languages.of(context)?.image}:', Icons.image),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.type}:', 'Single'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.name}:', 'SL_1128'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.code}:', '354635'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.brand}:', 'Test Band'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.category}:', 'Perfumes'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.cost}:', '15.00'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.price}:', '15.00'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.unit}:', '15.00'),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.quantity}:', '0 pcs'),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
