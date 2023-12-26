import 'dart:convert';
import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m5azn_app_wms/consts/local_storage.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';
import 'package:m5azn_app_wms/network/apis.dart';
import 'package:m5azn_app_wms/network/dio_client.dart';
import 'package:m5azn_app_wms/views/auth/model/login_input_model.dart';
import 'package:m5azn_app_wms/views/auth/model/login_response.dart';

final loginControllerProvider = StateNotifierProvider.autoDispose<
    LoginController, AsyncValue<LoginResponse>>(
  (ref) => LoginController(),
);

class LoginController extends StateNotifier<AsyncValue<LoginResponse>> {
  LoginController() : super(AsyncValue.data(LoginResponse()));

  Future<void> authenticate(
      BuildContext context, String email, String password) async {
    state = const AsyncValue.loading();

    final loginInput = LoginInput(email: email, password: password);
    final dioClient = DioClient(Apis.auth_url, loginInput.toJson());

    try {
      final res = await dioClient.postApiData(false);

      log('this >>> ${json.decode(res)}');
      if (res.isNotEmpty) {
        final response = LoginResponse.fromJson(json.decode(res));

        if (response.status == true) {
          LocalStorage.writeStorage(LocalStorage.email, email);
          LocalStorage.writeStorage(LocalStorage.userName, response.username);
          LocalStorage.writeStorage(LocalStorage.password, password);
          LocalStorage.writeStorage(LocalStorage.userId, "453");
          NavigationService.navigateReplacementTo(
              '/${Languages.of(context)?.main}');

          state = AsyncValue.data(response);
        } else {
          showFlushBar(response.message ?? '');
        }
      } else {
        showFlushBar('Login failed');
      }
    } on FormatException {
      showFlushBar('Login failed');
    } catch (e) {
      showFlushBar(e.toString());
    }
  }

  void showFlushBar(String message) {
    Flushbar(
      message: message,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(NavigationService.navigatorKey.currentContext!);
  }
}
