import 'package:flutter_web_aula/pages/cars/car_list.dart';
import 'package:flutter_web_aula/pages/default.dart';
import 'package:flutter_web_aula/pages/users.dart';
import 'package:flutter_web_aula/widgets/header.dart';
import 'package:flutter_web_aula/widgets/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  bool get showMenu => MediaQuery.of(context).size.width > 500;
  int _currentIndex = 0;

  final List<Widget> _children = [
    DefaultPage(),
    CarPage(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(),
          Expanded(
            child: Container(
                child: Row(
                children: <Widget>[
//                showMenu ? Menu() : Container(),
                Menu(onTap: (index) => setState(() {
                    _currentIndex = index;
                  }),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: _children[_currentIndex],
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
