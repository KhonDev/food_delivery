import 'package:flutter/cupertino.dart';

class OrdersProvider extends ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  void changeSelectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
