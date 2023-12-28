import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get recoverPassword;

  String get backToLogin;

  String get email;

  String get sendResetEmail;

  String get emailHint;

  String get password;

  String get passwordHint;

  String get forgotPassword;

  String get signIn;

  String get changePassword;

  String get newPassword;

  String get changeNewPassHint;

  String get changeConfirmPassHint;

  String get confirmPassword;

  String get shippingOrders;

  String get locationDetail;

  String get allLocations;

  String get orderDetail;

  String get totalOrders;

  String get allProducts;

  String get productDetail;

  String get totalSellers;

  String get topSellingProducts;

  String get subscription;

  String get notifications;

  String get inbound;

  String get inboundDetail;

  String get rechargeWallet;

  String get payCard;

  String get transferMoney;

  String get paymentSummary;

  String get submit;

  String get bankName;

  String get accountHolder;

  String get ibanNumber;

  String get addReceiptImg;

  String get amount;

  String get add;

  String get dashboard;

  String get menu;

  String get allWallets;

  String get walletDetail;

  String get settings;

  String get renewUpgradeOptions;

  String get details;

  String get profile;

  String get wallet;

  String get reports;

  String get filter;

  String get reset;

  String get resetPassword;

  String get main;

  String get logIn;

  String get customerReturns;

  String get expiredProducts;

  String get languages;

  String get reporting;

  String get payments;

  String get profitLoss;

  String get productAlerts;

  String get warehouseReport;

  String get stockReport;

  String get productReport;

  String get saleReport;

  String get productSaleReport;

  String get purchaseReport;

  String get productPurchaseReport;

  String get customerReport;

  String get supplierReport;

  String get bestCustomers;

  String get updateProfile;

  String get address;

  String get phoneNumber;

  String get name;

  String get nearExpiryProducts;

  String get totalProducts;

  String get todayOrders;

  String get backOrders;

  String get qcOrders;

  String get returns;

  String get totalLocations;

  String get totalInventoryCost;

  String get selectWarehouse;

  String get checkInternet;

  String get paymentStatus;

  String get due;

  String get paid;

  String get grandTotal;

  String get status;

  String get warehouse;

  String get addedBy;

  String get date;

  String get reference;

  String get shippingStatus;

  String get product;

  String get category;

  String get brand;

  String get saleRef;

  String get customer;

  String get action;

  String get receivedOrders;

  String get locationCode;

  String get locationType;

  String get productNos;

  String get sale;

  String get code;

  String get cost;

  String get price;

  String get unit;

  String get quantity;

  String get type;

  String get image;

  String get promoduct;

  String get totalSales;

  String get totalAmount;

  String get order24Hours;

  String get order48Hours;

  String get logout;

  String get firstName;

  String get lastName;

  String get locations;

  String get pickingPath;

  String get cities;

  String get threePLManage;

  String get allocationRules;

  String get kplManage;

  String get pickingMaterial;

  String get smsSettings;

  String get smsTemplate;

  String get mailSettings;

  String get mailTemplate;

  String get sellers;
}
