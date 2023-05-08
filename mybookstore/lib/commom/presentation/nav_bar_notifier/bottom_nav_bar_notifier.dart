import 'package:flutter/cupertino.dart';

class NavBarNotifier extends ChangeNotifier {
  int navBarCurrentIndex = 0;
  static NavBarNotifier I = NavBarNotifier._internal();
  NavBarNotifier._internal();

  void changeIndex(int index) async {
    if (index == navBarCurrentIndex) return;
    navBarCurrentIndex = index;
    notifyListeners();
  }
}
