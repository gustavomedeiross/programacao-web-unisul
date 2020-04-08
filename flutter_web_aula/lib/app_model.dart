import 'package:flutter_web_aula/pages/default_page.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  Widget page;

  AppModel() {
    page = PaginaDefault();
  }

  setPage(Widget page) {
    this.page = page;

    notifyListeners();
  }
}