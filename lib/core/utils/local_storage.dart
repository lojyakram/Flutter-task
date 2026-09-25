import 'dart:ffi';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class LocalStorage{
   SharedPreferences? _prefs;

  Future<void> init()async{
    _prefs = await SharedPreferences.getInstance();
  }
  void setString({required String key, required String value}){
    _prefs?.setString(key, value);
  }
  void setBool({required String key, required Bool value}){
    _prefs?.setBool(key, value as bool);
  }

  String? getString( String key){
    return _prefs?.getString(key);

  }

}