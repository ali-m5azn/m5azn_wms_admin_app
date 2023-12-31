import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/controller/total_sellers_controller.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/model/total_seller_model.dart';
import 'package:m5azn_app_wms/views/widgets/excel_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class TotalSellersPage extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    TotalSellerModel totalSellerModel =
        ref.watch(totalSellersController).selectedTotalSeller;
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          children: [
            ScreenTitle(
              title: Languages.of(context)?.totalSellers ?? '',
              excelCallback: () => generateSellerExcel(
                  sellerLabel, totalSellerList, 'seller_invoice.xlsx'),
              pdfClickCallback: () => generateSellerPDF(),
            ),
            _buildDetailRow('Shopname:', totalSellerModel.shopName ?? ''),
            const Divider(),
            _buildDetailRow('Cr Name:', totalSellerModel.crName ?? ''),
            const Divider(),
            _buildDetailRow('Cr:', totalSellerModel.cr ?? ''),
            const Divider(),
            _buildDetailRow('Vat:', totalSellerModel.vat ?? ''),
            const Divider(),
            _buildDetailRow(
                'accountManger:', totalSellerModel.accountManager ?? ''),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.phoneNumber}:',
                totalSellerModel.phone ?? ''),
            const Divider(),
            _buildDetailRow('${Languages.of(context)?.email}:',
                totalSellerModel.email ?? ''),
            const Divider(),
            _buildStatusRow('${Languages.of(context)?.status}:', true),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
