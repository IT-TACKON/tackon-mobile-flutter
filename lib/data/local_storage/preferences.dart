import 'package:get_storage/get_storage.dart';

class Preferences {
  final box = GetStorage();

  static const String isAuthKey = 'auth';
  static const String authorizationKey = 'authKey';

  String get authorizationCode => box.read(authorizationKey) ?? '';
  set authorizationCode(String val) => box.write(authorizationKey, val);

  bool get isAuthenticated => box.read(isAuthKey) ?? false;
  set isAuthenticated(bool val) => box.write(isAuthKey, val);

  Future<void> clearPrefs() async => await box.erase();
}
