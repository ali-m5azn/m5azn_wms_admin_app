import 'package:flutter_riverpod/flutter_riverpod.dart';

final backOrderController =
    StateNotifierProvider<BackOrderProvider, BackOrderState>(
        (ref) => BackOrderProvider());

class BackOrderProvider extends StateNotifier<BackOrderState> {
  BackOrderProvider() : super(BackOrderState());
}

class BackOrderState {
  BackOrderState();

  BackOrderState copyWith() {
    return BackOrderState();
  }
}
