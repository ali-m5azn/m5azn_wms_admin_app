import 'package:flutter/material.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/views/auth/screens/forgot_password_view.dart';
import 'package:m5azn_app_wms/views/auth/screens/login_view.dart';
import 'package:m5azn_app_wms/views/auth/screens/reset_password_view.dart';
import 'package:m5azn_app_wms/views/home/dashboard/back_orders/screens/back_order_detail_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/back_orders/screens/back_orders_list.dart';
import 'package:m5azn_app_wms/views/home/dashboard/inbound/screens/inbound_list_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/inbound/screens/inbound_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/returns/screens/returns_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/shipping_orders_page/screens/shipping_orders_list_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/shipping_orders_page/screens/shipping_orders_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_locations/screens/location_detail_view.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_locations/screens/total_locations_list_view.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/screens/order_detail_view.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/screens/total_orders_list_view.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_products/screens/all_products_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_products/screens/product_detail_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/screens/total_sellers_list_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/screens/total_sellers_page.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_selling_products/top_selling_products_page.dart';
import 'package:m5azn_app_wms/views/home/filter_page.dart';
import 'package:m5azn_app_wms/views/home/main_view.dart';
import 'package:m5azn_app_wms/views/home/menu/feature_enable_warning_page.dart';
import 'package:m5azn_app_wms/views/home/menu/profile/profile_view.dart';
import 'package:m5azn_app_wms/views/home/menu/reporting/reporting_view.dart';
import 'package:m5azn_app_wms/views/home/menu/settings/settings_page.dart';
import 'package:m5azn_app_wms/views/home/menu/subscription/subscription_page.dart';
import 'package:m5azn_app_wms/views/home/menu/wallet/wallet_detail_view.dart';
import 'package:m5azn_app_wms/views/home/menu/wallet/wallet_list_view.dart';
import 'package:m5azn_app_wms/views/home/notifications_view.dart';
import 'package:m5azn_app_wms/views/home/recharge_wallet_view.dart';
import 'package:m5azn_app_wms/views/splash_view.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? navigateReplacementTo(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? popReplacementTo(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}

Route? generateRoute(RouteSettings settings) {
  BuildContext? currentContext = NavigationService.navigatorKey.currentContext;
  if (settings.name == '/${Languages.of(currentContext!)?.profile}') {
    return MaterialPageRoute(builder: (context) => const ProfileView());
  } else if (settings.name == '/${Languages.of(currentContext)?.filter}') {
    return MaterialPageRoute(
        builder: (context) => FilterPage(
              title: settings.arguments as String,
            ));
  } else if (settings.name == '/${Languages.of(currentContext)?.reports}') {
    return MaterialPageRoute(builder: (context) => const ReportingView());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.resetPassword}') {
    return MaterialPageRoute(builder: (context) => const ResetPasswordView());
  } else if (settings.name == '/${Languages.of(currentContext)?.main}') {
    return MaterialPageRoute(builder: (context) => const MainView());
  } else if (settings.name == '/${Languages.of(currentContext)?.logIn}') {
    return MaterialPageRoute(builder: (context) => const LoginView());
  } else if (settings.name == '/${Languages.of(currentContext)?.settings}') {
    return MaterialPageRoute(builder: (context) => const SettingsPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.walletDetail}') {
    return MaterialPageRoute(builder: (context) => const WalletDetailView());
  } else if (settings.name == '/${Languages.of(currentContext)?.wallet}') {
    return MaterialPageRoute(builder: (context) => const WalletListView());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.forgotPassword}') {
    return MaterialPageRoute(builder: (context) => const ForgotPasswordView());
  } else if (settings.name == '/${Languages.of(currentContext)?.returns}') {
    return MaterialPageRoute(
        builder: (context) => ReturnsPage(
              title: settings.arguments as String,
            ));
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.shippingOrders}') {
    return MaterialPageRoute(
        builder: (context) => const ShippingOrdersListPage());
  } else if (settings.name == '/shippingOrderDetail') {
    return MaterialPageRoute(builder: (context) => const ShippingOrdersPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.locationDetail}') {
    return MaterialPageRoute(builder: (context) => const LocationDetailView());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.totalLocations}') {
    return MaterialPageRoute(
        builder: (context) => const TotalLocationsListView());
  } else if (settings.name == '/${Languages.of(currentContext)?.orderDetail}') {
    return MaterialPageRoute(builder: (context) => const OrderDetailView());
  } else if (settings.name == '/${Languages.of(currentContext)?.totalOrders}') {
    return MaterialPageRoute(builder: (context) => const TotalOrdersListView());
  } else if (settings.name == '/${Languages.of(currentContext)?.allProducts}') {
    return MaterialPageRoute(builder: (context) => const AllProductsPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.productDetail}') {
    return MaterialPageRoute(builder: (context) => const ProductDetailsPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.totalSellers}') {
    return MaterialPageRoute(
        builder: (context) => const TotalSellersListPage());
  } else if (settings.name == '/sellerDetails') {
    return MaterialPageRoute(builder: (context) => const TotalSellersPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.topSellingProducts}') {
    return MaterialPageRoute(
        builder: (context) => const TopSellingProductsPage());
  } else if (settings.name == '/${Languages.of(currentContext)?.inbound}') {
    return MaterialPageRoute(builder: (context) => const InboundListPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.inboundDetail}') {
    return MaterialPageRoute(builder: (context) => const InboundPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.notifications}') {
    return MaterialPageRoute(builder: (context) => const NotificationsView());
  } else if (settings.name == '/${Languages.of(currentContext)?.backOrders}') {
    return MaterialPageRoute(builder: (context) => const BackOrdersPage());
  } else if (settings.name == '/backOrderDetail') {
    return MaterialPageRoute(builder: (context) => const BackOrderDetailPage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.rechargeWallet}') {
    return MaterialPageRoute(builder: (context) => const RechargeWalletView());
  } else if (settings.name == '/featureEnable') {
    return MaterialPageRoute(builder: (context) => const FeatureEnablePage());
  } else if (settings.name ==
      '/${Languages.of(currentContext)?.subscription}') {
    return MaterialPageRoute(builder: (context) => const SubscriptionPage());
  }
  return MaterialPageRoute(builder: (context) => const SplashView());
}
