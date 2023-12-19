import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m5azn_app_wms/consts/colors.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

class ReportingView extends StatelessWidget {
  const ReportingView({super.key});

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
                title: "Reporting",
                showTrailingOptions: false,
              ),
              _menuItemCard(
                title: "Payments",
                leadingIcon: Icons.payment,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Profit and Loss",
                leadingIcon: FontAwesomeIcons.dollarSign,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Product Quantity Alerts",
                leadingIcon: Icons.shelves,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Warehouse Report",
                leadingIcon: FontAwesomeIcons.pieChart,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Stock Report",
                leadingIcon: FontAwesomeIcons.pieChart,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Product Report",
                leadingIcon: FontAwesomeIcons.pieChart,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Sale Report",
                leadingIcon: FontAwesomeIcons.waveSquare,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Product Sales Report",
                leadingIcon: FontAwesomeIcons.waveSquare,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Purchase Report",
                leadingIcon: FontAwesomeIcons.barChart,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Product Purchases Report",
                leadingIcon: FontAwesomeIcons.waveSquare,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Customer Report",
                leadingIcon: FontAwesomeIcons.barChart,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Supplier Report",
                leadingIcon: FontAwesomeIcons.pieChart,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Top Selling Products",
                leadingIcon: FontAwesomeIcons.pieChart,
                callBack: () => {},
              ),
              _menuItemCard(
                title: "Best Customers",
                leadingIcon: FontAwesomeIcons.pieChart,
                callBack: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItemCard({
    required String title,
    required IconData leadingIcon,
    required GestureTapCallback callBack,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 5.0.h),
      child: ListTile(
        onTap: callBack,
        leading: Icon(
          leadingIcon,
          color: const Color(secondaryColor),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 3.0.sp),
        ),
      ),
    );
  }
}
