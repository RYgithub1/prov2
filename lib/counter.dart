
import 'package:flutter/foundation.dart';



// class Counter extends ChangeNotifier{
class Counter with ChangeNotifier{
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }

}