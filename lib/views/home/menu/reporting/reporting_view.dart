import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';
import 'package:url_launcher/url_launcher.dart';

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
              ScreenTitle(
                title: Languages.of(context)?.reporting ?? '',
                showTrailingOptions: false,
              ),
              _buildExpansionTile(
                  title: Languages.of(context)?.payments ?? '',
                  leadingIcon: Icons.payment,
                  options: [
                    'Purchases',
                    'All Orders',
                    'Returns',
                    'Purchases Return',
                  ]),
              const SizedBox(
                height: 20,
              ),
              _menuItemCard(
                title: Languages.of(context)?.profitLoss ?? '',
                leadingIcon: FontAwesomeIcons.dollarSign,
                callBack: () => _launchUrl('profit_and_loss'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.productAlerts ?? '',
                leadingIcon: Icons.shelves,
                callBack: () => _launchUrl('quantity_alerts'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.warehouseReport ?? '',
                leadingIcon: FontAwesomeIcons.chartPie,
                callBack: () => _launchUrl('quantity_alerts'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.stockReport ?? '',
                leadingIcon: FontAwesomeIcons.chartPie,
                callBack: () => _launchUrl('stock_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.productReport ?? '',
                leadingIcon: FontAwesomeIcons.chartPie,
                callBack: () => _launchUrl('product_purchases_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.saleReport ?? '',
                leadingIcon: FontAwesomeIcons.waveSquare,
                callBack: () => _launchUrl('sales_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.productSaleReport ?? '',
                leadingIcon: FontAwesomeIcons.waveSquare,
                callBack: () => _launchUrl('product_sales_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.purchaseReport ?? '',
                leadingIcon: FontAwesomeIcons.chartBar,
                callBack: () => _launchUrl('product_sales_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.productPurchaseReport ?? '',
                leadingIcon: FontAwesomeIcons.waveSquare,
                callBack: () => _launchUrl('product_purchases_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.customerReport ?? '',
                leadingIcon: FontAwesomeIcons.chartBar,
                callBack: () => _launchUrl('customers_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.supplierReport ?? '',
                leadingIcon: FontAwesomeIcons.chartPie,
                callBack: () => _launchUrl('customers_report'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.topSellingProducts ?? '',
                leadingIcon: FontAwesomeIcons.chartPie,
                callBack: () => _launchUrl('top_selling_products'),
              ),
              _menuItemCard(
                title: Languages.of(context)?.bestCustomers ?? '',
                leadingIcon: FontAwesomeIcons.chartPie,
                callBack: () => _launchUrl('top_customers'),
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
          // color: const Color(secondaryColor),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 3.0.sp),
        ),
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required IconData leadingIcon,
    required List<String> options,
  }) {
    return Card(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: ExpansionTile(
          leading: Icon(
            leadingIcon,
            // color: const Color(secondaryColor),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18.0),
          ),
          children: options.map((option) {
            return ListTile(
              title: Text(
                option,
                style: const TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                // Handle tap on the option
                if (option == 'Purchase') {
                  _launchUrl('payments_purchase');
                } else if (option == 'All Orders') {
                  _launchUrl('payments_sale');
                } else if (option == 'Returns') {
                  _launchUrl('payments_sales_returns');
                } else {
                  _launchUrl('payments_purchases_returns');
                }
              },
            );
          }).toList(),
        ));
  }

  _launchUrl(String uri) async {
    bool launch =
        await launchUrl(Uri.parse('https://m5aznwms.com/app/reports/$uri'));
    if (!launch) {
      throw Exception('Could not launch $uri');
    }
  }
}
