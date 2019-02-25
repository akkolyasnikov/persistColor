import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SomeServerApi {
  static _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static load() async {
    SharedPreferences shp = await SomeServerApi._init();
    var res = shp.getString('color');

    return colorFromString(res);
  }

  static colorFromString(String colorString) {
    String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    Color otherColor = new Color(value);
    return otherColor;
  }

  static save(Color color)  {
    SomeServerApi._init().then((prefInst) {
      prefInst.setString('color', color.toString());
      
    });
  }
}
