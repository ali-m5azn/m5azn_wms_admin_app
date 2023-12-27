import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/base_views/custom_app_bar.dart';
import 'package:m5azn_app_wms/views/widgets/screen_title.dart';
import 'package:m5azn_app_wms/views/widgets/timer_widget.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final InAppPurchase _iap = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializePurchase();
  }

  Future<void> _initializePurchase() async {
    final bool available = await _iap.isAvailable();

    if (!available) {
      // Handle the case where in-app purchases are not available on the platform
      return;
    }

    _subscription =
        _iap.purchaseStream.listen((List<PurchaseDetails> purchases) {
      _handlePurchases(purchases);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      print('Error initializing purchase stream: $error');
    });
  }

  Future<void> _handlePurchases(List<PurchaseDetails> purchases) async {
    for (PurchaseDetails purchase in purchases) {
      // Handle each purchase, check for subscription renewals, etc.
      if (purchase.status == PurchaseStatus.purchased) {
        // Process the purchase, e.g., grant access to premium content
        print('Purchase successful: ${purchase.productID}');
      } else if (purchase.status == PurchaseStatus.error) {
        print('Purchase error: ${purchase.error}');
      }
    }
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
            ScreenTitle(
                title: Languages.of(context)?.subscription ?? '',
                showTrailingOptions: false),
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
                  print('clicked');
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

    const List<String> kProductIds = [
      'android.test.purchased',
      'point_1000',
      '5000_point',
      'android.test.canceled',
    ];
    bool isAvailable = await _iap.isAvailable();
    if (!isAvailable) {
      print('In-app purchases not available');
      return;
    }

    try {
      // Make the purchase
      PurchaseParam purchaseParam = PurchaseParam(
          productDetails: ProductDetails(
        id: kProductIds[0],
        title: 'Subscription',
        description: '',
        price: '100',
        rawPrice: 100,
        currencyCode: 'INR',
      ));
      bool isPurchased =
          await _iap.buyNonConsumable(purchaseParam: purchaseParam);

      if (isPurchased) {
        // Handle the successful purchase (e.g., grant access to premium content)
        print('Purchase successful');
      } else {
        print('Purchase canceled');
      }
    } catch (error) {
      print('Purchase error: $error');
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
