import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class WalletDetailView extends StatelessWidget {
  const WalletDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.2.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitle(
                title: "Wallet Detail",
                showFilters: false,
              ),
              _walletDetailRow(
                  title: "Transaction Date", data: "Tue 02/10/2023 11:20 am"),
              _walletDetailRow(
                  title: "Transaction Number", data: "M5azn02123456"),
              _walletDetailRow(title: "Credit Amount", data: "50.00 SAR"),
              _walletDetailRow(title: "Debit Amount", data: "43.08 SAR"),
              _walletDetailRow(title: "Pending", data: "1000 SAR"),
              _walletDetailRow(title: "Balance", data: "500 SAR"),
              _walletDetailRow(
                  title: "Remarks",
                  data: "Pending amount of 1000 SAR with bank charges."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _walletDetailRow({required String title, required String data}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 2.6.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Text(
            data,
            style: TextStyle(fontSize: 2.5.sp, fontWeight: FontWeight.w500),
          ),
          Divider(
            thickness: 0.15.h,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
