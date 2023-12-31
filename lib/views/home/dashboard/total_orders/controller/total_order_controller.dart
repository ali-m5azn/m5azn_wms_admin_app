import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_orders/model/sale_item_model.dart';

final totalOrderController =
    StateNotifierProvider<TotalOrderProvider, TotalOrderState>(
        (ref) => TotalOrderProvider());

class TotalOrderProvider extends StateNotifier<TotalOrderState> {
  TotalOrderProvider() : super(TotalOrderState(saleItemModel: SaleItemModel()));

  selectTotalSeller(SaleItemModel saleItemModel) {
    state = state.copyWith(saleItemModel: saleItemModel);
  }
}

class TotalOrderState {
  SaleItemModel saleItemModel;
  TotalOrderState({required this.saleItemModel});

  TotalOrderState copyWith({SaleItemModel? saleItemModel}) {
    return TotalOrderState(saleItemModel: saleItemModel ?? this.saleItemModel);
  }
}
