import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/shipping_orders_page/controller/shipping_order_controller.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_shipping_orders_widget.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class ShippingOrdersPage extends ConsumerWidget {
  const ShippingOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shippingOrderModel =
        ref.watch(shippingOrderController).shippingOrderModel;
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          children: [
            ScreenTitle(
              title: Languages.of(context)?.shippingOrders ?? '',
              showFilters: false,
              pdfClickCallback: () => generateShippingPDF(),
            ),
            _buildRowItem(Languages.of(context)?.date ?? '',
                shippingOrderModel.date ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.saleRef ?? '',
                shippingOrderModel.sale_ref ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.customer ?? '',
                shippingOrderModel.customer ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.warehouse ?? '',
                shippingOrderModel.warehouse ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.status ?? '',
                shippingOrderModel.status ?? ''),
            const Divider(),
            _buildRowItem(Languages.of(context)?.action ?? '',
                shippingOrderModel.action ?? ''),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem(String label, String value) {
    return SizedBox(
      height: 5.0.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label :'),
          Text(value)
          // You can add additional widgets here if needed
        ],
      ),
    );
  }
}
