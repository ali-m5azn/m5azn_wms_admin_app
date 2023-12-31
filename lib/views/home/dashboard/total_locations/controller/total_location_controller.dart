import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalLocationController =
    StateNotifierProvider<TotalLocationProvider, TotalLocationState>(
        (ref) => TotalLocationProvider());

class TotalLocationProvider extends StateNotifier<TotalLocationState> {
  TotalLocationProvider() : super(TotalLocationState());
}

class TotalLocationState {
  TotalLocationState();

  TotalLocationState copyWith() {
    return TotalLocationState();
  }
}
