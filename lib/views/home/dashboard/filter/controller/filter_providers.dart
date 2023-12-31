import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = StateNotifierProvider<FilterProvider, FilterState>(
    (ref) => FilterProvider());

class FilterProvider extends StateNotifier<FilterState> {
  FilterProvider()
      : super(FilterState(
          dateVal: '',
          warehouseVal: '',
          statusVal: '',
          referenceVal: '',
          shippingStatusVal: '',
          saleVal: '',
          paymentStatusVal: '',
          customerVal: '',
          categoryVal: '',
          brandVal: '',
          codeProductVal: '',
          productVal: '',
        ));

  void changeSaleRef(String? newValue) {
    state = state.copyWith(saleVal: newValue);
  }

  void changeBrandRef(String? newValue) {
    state = state.copyWith(brandVal: newValue);
  }

  void changeCatRef(String? newValue) {
    state = state.copyWith(categoryVal: newValue);
  }

  void changeCustomerRef(String? newValue) {
    state = state.copyWith(customerVal: newValue);
  }

  void changeWarehouseRef(String? newValue) {
    state = state.copyWith(warehouseVal: newValue);
  }

  void changeStatusRef(String? newValue) {
    state = state.copyWith(statusVal: newValue);
  }

  void changePaymentStatusRef(String? newValue) {
    state = state.copyWith(paymentStatusVal: newValue);
  }

  void changeShippingStatusRef(String? newValue) {
    state = state.copyWith(shippingStatusVal: newValue);
  }

  void changeCodeProductRef(String? newValue) {
    state = state.copyWith(codeProductVal: newValue);
  }

  void changeDateRef(String dateVal) {
    state = state.copyWith(dateVal: dateVal);
  }

  void changeReference(String value) {
    state = state.copyWith(referenceVal: value);
  }

  void changeProduct(String value) {
    state = state.copyWith(productVal: value);
  }
}

class FilterState {
  final String dateVal;
  final String saleVal;
  final String brandVal;
  final String customerVal;
  final String warehouseVal;
  final String statusVal;
  final String codeProductVal;
  final String categoryVal;
  final String referenceVal;
  final String paymentStatusVal;
  final String shippingStatusVal;
  final String productVal;

  FilterState({
    required this.dateVal,
    required this.saleVal,
    required this.brandVal,
    required this.customerVal,
    required this.warehouseVal,
    required this.statusVal,
    required this.categoryVal,
    required this.codeProductVal,
    required this.referenceVal,
    required this.paymentStatusVal,
    required this.productVal,
    required this.shippingStatusVal,
  });

  FilterState copyWith({
    String? dateVal,
    String? brandVal,
    String? customerVal,
    String? paymentStatusVal,
    String? saleVal,
    String? shippingStatusVal,
    String? statusVal,
    String? categoryVal,
    String? codeProductVal,
    String? referenceVal,
    String? productVal,
    String? warehouseVal,
  }) {
    return FilterState(
      dateVal: dateVal ?? this.dateVal,
      brandVal: brandVal ?? this.brandVal,
      customerVal: customerVal ?? this.customerVal,
      paymentStatusVal: paymentStatusVal ?? this.paymentStatusVal,
      saleVal: saleVal ?? this.saleVal,
      codeProductVal: codeProductVal ?? this.codeProductVal,
      referenceVal: referenceVal ?? this.referenceVal,
      categoryVal: categoryVal ?? this.categoryVal,
      shippingStatusVal: shippingStatusVal ?? this.shippingStatusVal,
      statusVal: statusVal ?? this.statusVal,
      productVal: productVal ?? this.productVal,
      warehouseVal: warehouseVal ?? this.warehouseVal,
    );
  }
}
