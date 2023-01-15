import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class cacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  // ignore: non_constant_identifier_names
  static Future<bool>? PutData({
    // ignore: non_constant_identifier_names
    required String Key,
    required bool value,
})async{
    return await sharedPreferences!.setBool(Key, value);
  }
  // ignore: non_constant_identifier_names
  static bool? GetData({
    // ignore: non_constant_identifier_names
    required String Key,
  }){
    return sharedPreferences!.getBool(Key);
  }
}