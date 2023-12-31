import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m5azn_app_wms/views/home/dashboard/total_sellers/model/total_seller_model.dart';

final totalSellersController =
    StateNotifierProvider<TotalSellersProvider, TotalSellersState>(
        (ref) => TotalSellersProvider());

class TotalSellersProvider extends StateNotifier<TotalSellersState> {
  TotalSellersProvider()
      : super(TotalSellersState(selectedTotalSeller: TotalSellerModel()));

  selectTotalSeller(TotalSellerModel totalSellerModel) {
    state = state.copyWith(selectedTotalSeller: totalSellerModel);
  }
}

class TotalSellersState {
  TotalSellerModel selectedTotalSeller;
  TotalSellersState({required this.selectedTotalSeller});

  TotalSellersState copyWith({TotalSellerModel? selectedTotalSeller}) {
    return TotalSellersState(
        selectedTotalSeller: selectedTotalSeller ?? this.selectedTotalSeller);
  }
}
