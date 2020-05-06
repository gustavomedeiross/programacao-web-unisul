import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web_aula/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Center(
            child: Container(
//              width: MediaQuery.of(context).size.width * 0.3,
//              height: MediaQuery.of(context).size.height * 0.5,
              width: 460,
              height: 380,
              decoration: BoxDecoration(
                color: Color.fromARGB(230, 242, 244, 245),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 76,
                    child: Center(
                      child: FlutterLogo(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    child: LoginForm(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
