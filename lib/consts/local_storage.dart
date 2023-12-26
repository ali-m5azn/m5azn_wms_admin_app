import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static const String email = 'email';
  static const String password = 'password';
  static const String userId = 'userId';
  static const String userName = 'userName';
  static const String accessToken = 'accessToken';

  static const String deviceSupported = 'deviceSupported';

  static const String lanCode = 'languageCode';

  static writeStorage(var key, var value) {
    GetStorage().write(key, value);
  }

  static readStorage(var key) {
    return GetStorage().read(key);
  }

  static removeStorage(var key) {
    GetStorage().remove(key);
  }

  static eraseStorage() {
    GetStorage().erase();
  }
}
