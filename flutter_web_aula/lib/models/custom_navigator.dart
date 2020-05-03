import 'package:flutter/material.dart';

class CustomNavigator {
  String title;
  Widget page;

  CustomNavigator({ @required this.title, @required this.page });

  @override
  String toString() {
    return this.title;
  }
}