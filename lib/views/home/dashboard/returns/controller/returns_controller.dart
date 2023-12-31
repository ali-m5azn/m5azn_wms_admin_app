import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m5azn_app_wms/views/home/dashboard/returns/model/customer_return_model.dart';

final returnsController = StateNotifierProvider<ReturnsProvider, ReturnsState>(
    (ref) => ReturnsProvider());

class ReturnsProvider extends StateNotifier<ReturnsState> {
  ReturnsProvider()
      : super(ReturnsState(customerReturnModel: CustomerReturnModel()));

  selectShippingOrder(CustomerReturnModel shippingOrderModel) {
    state = state.copyWith(customerReturnModel: shippingOrderModel);
  }
}

class ReturnsState {
  CustomerReturnModel customerReturnModel;
  ReturnsState({required this.customerReturnModel});

  ReturnsState copyWith({CustomerReturnModel? customerReturnModel}) {
    return ReturnsState(
        customerReturnModel: customerReturnModel ?? this.customerReturnModel);
  }
}
