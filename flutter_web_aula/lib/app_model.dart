import 'package:flutter_web_aula/models/custom_navigator.dart';
import 'package:flutter_web_aula/pages/default.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  List<CustomNavigator> navigationStack = [];

  AppModel() {
    this.navigationStack.add(CustomNavigator(title: 'Home',  page: DefaultPage()));
  }

  setNavigation(CustomNavigator navigator, { bool replace = false }) {
    if(replace) {
      navigationStack.clear();
      navigationStack.add(CustomNavigator(title: 'Home',  page: DefaultPage()));
    }

    if (navigator.title != 'Home') {
      navigationStack.add(navigator);
    }

    notifyListeners();
  }

  pop() {
    navigationStack.removeLast();
    notifyListeners();
  }

  clearNavigationStack() {
    navigationStack.clear();
    navigationStack.add(CustomNavigator(title: 'Home',  page: DefaultPage()));
    notifyListeners();
  }

  popRange(int popRange) {
    navigationStack.removeRange(popRange + 1, navigationStack.length);
    notifyListeners();
  }
}
