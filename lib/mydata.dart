import 'package:flutter/foundation.dart';

class MyData extends ChangeNotifier {
  double _value = 0.5;
  double get value => _value;

//setter
  set value(double value) {
    _value = value;
    notifyListeners();
  }
}
