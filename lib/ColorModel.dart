import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:testtask/SomeServerApi.dart';

class ColorModel extends Model {
  ColorModel() {
    _color = Color.fromRGBO(255, 200, 100, 1);
    SomeServerApi.load().then((color) {
      _color = color;
      notifyListeners();
    });
  }
  Color _color;
  Color get color => _color;
  randomColor() {
    _color =
        Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    SomeServerApi.save(_color);
    SomeServerApi.load();
    notifyListeners();
  }
}
