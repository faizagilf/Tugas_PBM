import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class StateProvider extends ChangeNotifier {
  bool _passenable = true;
  bool get passenable => _passenable;

  state() {
    if (passenable) {
      _passenable = false;
    } else {
      _passenable = true;
    }
    notifyListeners();
  }
}
