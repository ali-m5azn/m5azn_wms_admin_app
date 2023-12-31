import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m5azn_app_wms/views/home/dashboard/shipping_orders_page/model/shipping_orders_model.dart';

final shippingOrderController =
    StateNotifierProvider<ShippingOrderProvider, ShippingOrderState>(
        (ref) => ShippingOrderProvider());

class ShippingOrderProvider extends StateNotifier<ShippingOrderState> {
  ShippingOrderProvider()
      : super(ShippingOrderState(shippingOrderModel: ShippingOrderModel()));

  selectShippingOrder(ShippingOrderModel shippingOrderModel) {
    state = state.copyWith(shippingOrderModel: shippingOrderModel);
  }
}

class ShippingOrderState {
  ShippingOrderModel shippingOrderModel;
  ShippingOrderState({required this.shippingOrderModel});

  ShippingOrderState copyWith({ShippingOrderModel? shippingOrderModel}) {
    return ShippingOrderState(
        shippingOrderModel: shippingOrderModel ?? this.shippingOrderModel);
  }
}
