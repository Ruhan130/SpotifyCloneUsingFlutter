import 'package:shared_preferences/shared_preferences.dart';

class PrefService{
  Future createCache(String password) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cache = preferences.setString("password", password);
    return cache;
  }
  Future readCache(String password) async {
    SharedPreferences prefernece = await SharedPreferences.getInstance();
    prefernece.getString("password");
  }
  Future removeChache(String password) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.remove("password");
  }
}