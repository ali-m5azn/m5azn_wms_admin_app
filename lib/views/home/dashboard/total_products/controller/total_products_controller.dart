import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_products/model/product_item_model.dart';

final totalProductController =
    StateNotifierProvider<TotalProductProvider, TotalProductState>(
        (ref) => TotalProductProvider());

class TotalProductProvider extends StateNotifier<TotalProductState> {
  TotalProductProvider()
      : super(TotalProductState(productItemModel: ProductItemModel()));

  selectTotalProduct(ProductItemModel productItemModel) {
    state = state.copyWith(productItemModel: productItemModel);
  }
}

class TotalProductState {
  ProductItemModel productItemModel;
  TotalProductState({required this.productItemModel});

  TotalProductState copyWith({ProductItemModel? productItemModel}) {
    return TotalProductState(
        productItemModel: productItemModel ?? this.productItemModel);
  }
}
