import 'package:flutter_web_aula/pages/default.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  Widget page;

  AppModel() {
    this.page = DefaultPage();
    notifyListeners();
  }

  setPage(Widget page) {
    this.page = page;

    notifyListeners();
  }
}
