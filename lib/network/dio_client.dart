import 'dart:async';
import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m5azn_app_wms/consts/local_storage.dart';
import 'package:m5azn_app_wms/consts/localization/language/languages.dart';
import 'package:m5azn_app_wms/consts/navigation_service.dart';

import 'apis.dart';

class DioClient {
  final String url;
  final dynamic bodyData;

  DioClient(this.url, this.bodyData);

  Future<String> getApiData([bool isAuth = true]) async {
    try {
      final headers = getApiHeaders();
      final request = http.Request('GET', Uri.parse(Apis.base_url + url))
        ..headers.addAll(headers);

      final response = await request.send();
      return handleResponse(response);
    } catch (e) {
      handleError(e);
    }
    return "";
  }

  Future<String> postApiData([bool isAuth = true]) async {
    try {
      final headers = getApiHeaders();
      final request = http.Request('POST', Uri.parse(Apis.base_url + url))
        ..headers.addAll(headers)
        ..body = json.encode(bodyData);

      print('this is >> ${request.body}');
      final response = await request.send();
      return handleResponse(response);
    } catch (e) {
      handleError(e);
    }
    return "";
  }

  Future<String> handleResponse(http.StreamedResponse response) {
    if (response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      handleErrorResponse(response);
    }
    return Future.value('');
  }

  void handleErrorResponse(http.StreamedResponse response) async {
    final statusCode = response.statusCode;

    final message =
        jsonDecode(await response.stream.bytesToString())['message'];
    if (statusCode == 401) {
      handleAuthError();
    } else if (statusCode == 500) {
      Flushbar(
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(NavigationService.navigatorKey.currentContext!);
    } else {
      Flushbar(
        message: message ?? response.reasonPhrase,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(NavigationService.navigatorKey.currentContext!);
    }
  }

  void handleAuthError() {
    final isCheckAuth = LocalStorage.readStorage('isCheckAuth');

    if (isCheckAuth != null && isCheckAuth == 1) {
      Flushbar(
        message: 'Session has expired',
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(NavigationService.navigatorKey.currentContext!);
      LocalStorage.writeStorage('isCheckAuth', 0);
    }
  }

  Map<String, String> getApiHeaders() {
    Map<String, String> authHeader;
    bool isAuth = LocalStorage.readStorage(LocalStorage.accessToken) != null &&
        LocalStorage.readStorage(LocalStorage.accessToken).isNotEmpty;
    if (isAuth) {
      authHeader = {
        'Authorization':
            LocalStorage.readStorage(LocalStorage.accessToken).toString(),
        'Content-Type': 'application/json',
      };
    } else {
      authHeader = {
        'Content-Type': 'application/json',
      };
    }
    return authHeader;
  }

  void handleError(dynamic e) {
    if (e is TimeoutException) {
      Flushbar(
        message: Languages.of(NavigationService.navigatorKey.currentContext!)
            ?.checkInternet,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(NavigationService.navigatorKey.currentContext!);
    } else {
      Flushbar(
        message: e.toString(),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(NavigationService.navigatorKey.currentContext!);
    }
  }
}
