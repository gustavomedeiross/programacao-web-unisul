import 'dart:math';

import 'package:bmi_calculator/widgets/bmi_jumbotron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  num bmi;

  num _calculateBmi(double height, double weight) {
    return weight / pow(height, 2);
  }

  final MoneyMaskedTextController _weightController =
      MoneyMaskedTextController(rightSymbol: ' kg', decimalSeparator: '.');
  final MoneyMaskedTextController _heightController =
      MoneyMaskedTextController(rightSymbol: ' m', decimalSeparator: '.');

  String _weightValidator(String value) {
    if (_weightController.numberValue <= 0) {
      return "Please enter a valid weight";
    }

    return null;
  }

  String _heightValidator(String value) {
    if (_weightController.numberValue <= 0) {
      return "Please enter a valid height";
    }

    return null;
  }

  Widget _textFormField(
      {@required String labelText,
      TextEditingController controller,
      Function validator}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  _clearAll() {
    _weightController.clear();
    _heightController.clear();
    setState(() {
      bmi = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        actions: <Widget>[
          IconButton(
            onPressed: _clearAll,
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              BmiJumbotron(bmi: bmi),
              _textFormField(
                  labelText: 'Weight',
                  controller: _weightController,
                  validator: _weightValidator),
              SizedBox(
                height: 10,
              ),
              _textFormField(
                  labelText: 'Height',
                  controller: _heightController,
                  validator: _heightValidator),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('hello');
                      num bmiResult = _calculateBmi(
                          _heightController.numberValue,
                          _weightController.numberValue);

                      setState(() {
                        bmi = bmiResult;
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
