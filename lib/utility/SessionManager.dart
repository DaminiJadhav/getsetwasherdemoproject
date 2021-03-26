import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance??= await SharedPreferences.getInstance();
      static SharedPreferences _prefsInstance;


  static Future<SharedPreferences> init() async{
    _prefsInstance=await _instance;
    return _prefsInstance;
  }

  static Future<bool>  setrole(String role) async{
    var pref=await _instance;
    return pref.setString("ROLE_KEY", role);
  }


  static getrole(){
    return _prefsInstance.getString("ROLE_KEY");
  }

  save(value) async{
    var pref=await _instance;
    return pref.setString("userregistration", json.encode(value));
  }

   read() {
    return json.decode(_prefsInstance.getString("userregistration"));
  }

  washersave(value) async{
    var pref=await _instance;
    return pref.setString("WahserRegistration", json.encode(value));
  }

  washerread() {
    return json.decode(_prefsInstance.getString("WahserRegistration"));
  }

}