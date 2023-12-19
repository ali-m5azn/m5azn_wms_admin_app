import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/order_detail_view.dart';
import 'package:m5azn_app_wms/views/home/menu/wallet/wallet_detail_view.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class WalletListView extends StatelessWidget {
  const WalletListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenTitle(title: "All Wallets"),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) => _walletCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _walletCard(BuildContext context) {
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
          "Tue 02/10/2023 11:20 am",
          style: TextStyle(fontSize: 2.3.sp, fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          "M5azn02123456",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4.w,
          children: [
            Text(
              "34",
              style: TextStyle(
                  fontSize: 2.5.sp,
                  color: Colors.green,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WalletDetailView()),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.8.w),
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
