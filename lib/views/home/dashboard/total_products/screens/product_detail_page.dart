import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_products/controller/total_products_controller.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class ProductDetailsPage extends ConsumerWidget {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productModelItem = ref.watch(totalProductController).productItemModel;
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          children: [
            ScreenTitle(
                title: Languages.of(context)?.productDetail ?? '',
                showTrailingOptions: false),
            // _buildDetailRowImg('${Languages.of(context)?.image}:', Icons.image),
            Image.network(
                'https://m5aznwms.com/images/products/97818347-BD7.png'),
            _buildDetailRow(
                '${Languages.of(context)?.type}:', productModelItem.type ?? ''),
            const Divider(),
            _buildDetailRow(
                '${Languages.of(context)?.name}:', productModelItem.name ?? ''),
            const Divider(),
            _buildDetailRow(
                '${Languages.of(context)?.code}:', productModelItem.code ?? ''),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.brand}:',
                productModelItem.brand ?? ''),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.category}:',
                productModelItem.category ?? ''),
            const Divider(),
            _buildDetailRow(
                '${Languages.of(context)?.cost}:', productModelItem.cost ?? ''),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.price}:',
                productModelItem.price ?? ''),
            const Divider(),
            _buildDetailRow(
                '${Languages.of(context)?.unit}:', productModelItem.unit ?? ''),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.quantity}:',
                productModelItem.quantity ?? ''),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
