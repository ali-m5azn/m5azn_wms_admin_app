import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';

import 'views/widgets/timer_widget.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  late InAppPurchase inAppPurchase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inAppPurchase = InAppPurchase.instance;
    _initializePurchase();
  }

  Future<void> _initializePurchase() async {
    final bool available = await inAppPurchase.isAvailable();

    if (!available) {
      // Handle the case where in-app purchases are not available on the platform
      return;
    }

    // Set up listeners for purchase updates
    inAppPurchase.purchaseStream.listen((event) {
      inAppPurchase.completePurchase(event[0]);
    });

    // Load past purchases
    await inAppPurchase.restorePurchases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenTitle(title: Languages.of(context)?.subscription ?? ''),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0.w),
              child: const TimerWidget(),
            ),
            _buildInfoCard(DateFormat('M/d/y').format(DateTime.now())),
            const SizedBox(height: 10),
            _buildInfoCard('VIP'),
            const SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  _startPurchase();
                },
                child: _buildInfoCard(
                    Languages.of(context)?.renewUpgradeOptions ?? '')),
            // const SizedBox(height: 10),
            // _buildInfoCard(Languages.of(context)?.details ?? ''),
          ],
        ),
      ),
    );
  }

  Future<void> _startPurchase() async {
    // Replace 'your_product_id' with your actual product ID
    const String kConsumableId = 'consumable';
    const String kUpgradeId = 'upgrade';
    const String kSilverSubscriptionId = 'subscription_silver';
    const String kGoldSubscriptionId = 'subscription_gold';
    const Set<String> kProductIds = {
      kConsumableId,
      kUpgradeId,
      kSilverSubscriptionId,
      kGoldSubscriptionId,
    };
    final ProductDetailsResponse response =
        await inAppPurchase.queryProductDetails(kProductIds);

    print('response is >> $response');
    if (response.error != null) {
      // Handle the error
      return;
    }

    //  final ProductDetails productDetails = response.productDetails.first;

    try {
      final PurchaseParam purchaseParam = PurchaseParam(
        productDetails: ProductDetails(
            id: '1122',
            title: 'Product Data',
            currencyCode: 'IN',
            description: 'data',
            price: '200',
            rawPrice: 200,
            currencySymbol: 'INR'),
        applicationUserName: null, // You can use a unique user identifier here
      );

      await inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    } catch (e) {
      // Handle purchase initiation error
      print('Error during purchase: $e');
    }
  }

  Widget _buildInfoCard(String text) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        height: 12.0.w,
        child: Text(text),
      ),
    );
  }
}
