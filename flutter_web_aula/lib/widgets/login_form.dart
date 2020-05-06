import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web_aula/home.dart';
import 'package:flutter_web_aula/models/user.dart';
import 'package:flutter_web_aula/nav.dart';
import 'package:flutter_web_aula/pages/cars/index.dart';
import 'package:flutter_web_aula/repositories/login_repository.dart';
import 'package:flutter_web_aula/utils/alert.dart';
import 'package:flutter_web_aula/utils/api_response.dart';
import 'package:flutter_web_aula/widgets/inputs/text_form_field.dart';

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
        push(context, CarIndexPage(), replace: true);
      }
    } else {
      alert(context, response.message, 'Login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CustomTextFormField(label: 'Login', hint: 'Digite o login', controller: _login, validator: _loginValidator),
          SizedBox(height: 20,),
          CustomTextFormField(label: 'Senha', hint: 'Digite a senha', controller: _password, validator: _passwordValidator, obscureText: true),
          SizedBox(height: 20,),
          Container(
            height: 50,
            child: FlatButton(
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
