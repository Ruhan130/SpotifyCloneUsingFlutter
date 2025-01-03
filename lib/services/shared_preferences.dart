import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future createCache(String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("password", password);
  }

  Future readCache(String password) async {
    SharedPreferences prefernece = await SharedPreferences.getInstance();
    var cache = prefernece.getString("password");
    return cache;
  }

  Future removeChache(String password) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.remove("password");
  }

  //  Future<void> setOnBoardHide(int initScreen) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setInt('initScreen', initScreen);
  // }

  // Future<int?> getOnBoardHide() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getInt('initScreen');
  // }
}
