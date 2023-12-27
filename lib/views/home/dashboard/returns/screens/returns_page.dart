import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/returns/model/customer_return_model.dart';
import 'package:m5azn_app_wms/views/widgets/excel_seller_widget.dart';
import 'package:m5azn_app_wms/views/widgets/pdf_customer_returns_widget.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class ReturnsPage extends StatefulWidget {
  final String title;

  const ReturnsPage({super.key, required this.title});

  @override
  State<ReturnsPage> createState() => _ReturnsPageState();
}

class _ReturnsPageState extends State<ReturnsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          children: [
            ScreenTitle(
                title: widget.title,
                pdfClickCallback: () => generateCustomerReturnPDF(),
                excelCallback: () => generateSellerExcel(customerReturnLabel,
                    customerReturnList, 'customer_return_invoice.xlsx')),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) => _runSheetCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _runSheetCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 0.2.w,
        ),
      ),
      child: ListTile(
        title: Text(
          "name",
          style: TextStyle(fontSize: 3.sp),
        ),
        subtitle: const Text(
          "Sku1",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 2.w,
          children: [
            Text(
              "Pending",
              style: TextStyle(fontSize: 2.5.sp, fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 6.w,
                height: 6.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 4.0.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
