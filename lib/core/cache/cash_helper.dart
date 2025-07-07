import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveData({required String key, required String value}) async {
    await sharedPreferences?.setString(key, value);
  }

  static getData({required String key}) {
    return sharedPreferences?.getString(key);
  }

  static removeData({required String key}) {
    sharedPreferences?.remove(key);
  }
}
