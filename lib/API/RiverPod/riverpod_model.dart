// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RiverpodModel extends ChangeNotifier {
  int counter;
  RiverpodModel({
    required this.counter,
  });

  void addCounter() {
    counter++;
    notifyListeners();
  }

  void removeCounter() {
    counter--;
    notifyListeners();
  }
}
