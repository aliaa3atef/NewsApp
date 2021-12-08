import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashedHelper
{
  static SharedPreferences sharedPreferences ;

  static  init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setBoolean({@required String key , @required dynamic value  })async
  {
    return await sharedPreferences.setBool(key , value);
  }

  bool getBoolean({@required String key})
  {
    return  sharedPreferences.getBool(key);
  }
}