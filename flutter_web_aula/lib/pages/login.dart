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
//          Image.asset(
//            'assets/images/background.jpg',
//            fit: BoxFit.fill,
//            width: double.infinity,
//          ),
          Center(
            child: Container(
              width: 460,
              height: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 244, 245),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      ),
                    ),
                    height: 76,
                    child: Center(
                      child: Text(
                        'Carros',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
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
