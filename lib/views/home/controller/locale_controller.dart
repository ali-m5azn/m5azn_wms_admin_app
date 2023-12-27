import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m5azn_app_wms/consts/local_storage.dart';
import 'package:m5azn_app_wms/consts/localization/locale_constant.dart';

final localeProvider = ChangeNotifierProvider<LocaleProvider>((ref) {
  return LocaleProvider();
});

class LocaleProvider extends ChangeNotifier {
  Locale get locale =>
      _getlocale(LocalStorage.readStorage(LocalStorage.lanCode) ??
          AppLanguagesEnum.en.key);

  String get languageCode =>
      LocalStorage.readStorage(LocalStorage.lanCode) ?? AppLanguagesEnum.en.key;

  void setLocale(String languageCode) {
    LocalStorage.writeStorage(LocalStorage.lanCode, languageCode);
    notifyListeners();
  }

  Locale _getlocale(String languageCode) {
    return languageCode.isNotEmpty
        ? Locale(languageCode)
        : Locale(AppLanguagesEnum.en.key ?? "");
  }
}
