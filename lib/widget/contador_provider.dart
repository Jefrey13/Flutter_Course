import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier{
  ContadorProvider(this._counter);

  int _counter;
  int get counter => _counter;

  set counter(int value){
    _counter = value;
  }

  void increment(){
    _counter++;
    notifyListeners();
  }
}