import 'package:flutter_web_aula/widgets/body.dart';
import 'package:flutter_web_aula/widgets/header.dart';
import 'package:flutter_web_aula/widgets/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;
  bool get showMenu => size.width > 500;

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
                      showMenu ? Menu() : Container(),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Body(),
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


