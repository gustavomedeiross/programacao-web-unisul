import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web_aula/home.dart';
import 'package:flutter_web_aula/models/user.dart';
import 'package:flutter_web_aula/nav.dart';
import 'package:flutter_web_aula/pages/cars/car_list.dart';
import 'package:flutter_web_aula/repositories/login_repository.dart';
import 'package:flutter_web_aula/utils/alert.dart';
import 'package:flutter_web_aula/utils/api_response.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _login = TextEditingController();
  final _password = TextEditingController();

  final _loginRepository = LoginRepository();

  String _loginValidator(String text) {
    if(text.isEmpty) {
      return 'Digite o Login';
    }

    return null;
  }

  String _passwordValidator(String text) {
    if(text.isEmpty) {
      return 'Digite a senha';
    }

    if(text.length < 3) {
      return 'A senha precisa ter pelo menos 3 dígitos';
    }

    return null;
  }

  _handleClick() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    ApiResponse response = await _loginRepository.store(_login.text, _password.text);

    if (response.ok) {
      user = response.result;

      if (user.isAdmin()) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, CarPage(), replace: true);
      }
    } else {
      alert(context, response.message, 'Login');
    }
  }


  Widget _textFormField({ String label, String hint, TextEditingController controller, Function(String) validator, bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: label,
        labelStyle: TextStyle(fontSize: 20, color: Colors.black),
        hintText: hint,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _textFormField(label: 'Login', hint: 'Digite o login', controller: _login, validator: _loginValidator),
          Divider(),
          _textFormField(label: 'Senha', hint: 'Digite a senha', controller: _password, validator: _passwordValidator, obscureText: true),
          Divider(),
          Container(
            height: 50,
            width: 250,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onPressed: _handleClick,
              color: Color.fromARGB(255, 21, 61, 110),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
