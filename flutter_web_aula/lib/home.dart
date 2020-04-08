import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/constantes.dart';
import 'package:flutter_web_aula/web/body.dart';
import 'package:flutter_web_aula/web/header.dart';
import 'package:flutter_web_aula/web/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;
  bool get exibeMenu => size.width > 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      ),
    );
  }

  _header() {
    return Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: alturaCabecalho,
      color: Colors.blue,
      child: Header(),
    );

  }

  _body() {
    return Container(
      width: size.width,
      height: size.height - alturaCabecalho,
      child: exibeMenu
          ? Row(
        children: <Widget>[
          _menu(),
          _direita(),
        ],
      )
          : _direita(),
    );

  }

  _menu() {
    return Container(
      width: larguraMenu,
      color: Colors.grey[100],
      child: Menu(),
    );
  }

  _direita() {
    return Container(
      //color: Colors.yellow,
      padding: EdgeInsets.all(16),
      width: exibeMenu ? size.width - larguraMenu : size.width,
      child: Body(),
    );

  }
}
