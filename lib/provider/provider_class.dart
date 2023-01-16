import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  List _Fav = [];
  get myList => _Fav;
  void favour(String word) {
    final Lt = _Fav.contains(word);
    if (Lt) {
      _Fav.remove(word);
    } else {
      _Fav.add(word);
    }
    notifyListeners();
  }

  bool icn(String word) {
    final lst = _Fav.contains(word);
    return lst;
  }
}
