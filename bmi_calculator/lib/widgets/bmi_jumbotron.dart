import 'package:flutter/material.dart';

class BmiJumbotron extends StatelessWidget {
  final num bmi;
  BmiJumbotron({@required this.bmi});

  Widget _text(text,
      {double fontSize = 16.0, color = Colors.black54, TextAlign textAlign}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: color),
      textAlign: textAlign,
    );
  }

  _getBmiClassification(bmi) {
    if (bmi < 18.5) {
      return {
        'message': 'Be careful! You are classified as underweight',
        'color': Colors.cyan
      };
    }

    if (bmi < 24.9) {
      return {
        'message': 'Congratulations! You are classified as normal weight',
        'color': Colors.green
      };
    }

    if (bmi < 29.9) {
      return {
        'message': 'Be careful! You are classified as overweight',
        'color': Colors.orange
      };
    }

    return {
      'message': 'Be careful! You are classified as obese',
      'color': Colors.red
    };
  }

  @override
  Widget build(BuildContext context) {
    if (bmi == null) {
      return Container(
        padding: EdgeInsets.all(50),
        child:
            _text('Enter weight and height to check your BMI!', fontSize: 20),
      );
    }

    Map bmiClassification = _getBmiClassification(bmi);

    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          _text('Your BMI is:'),
          Container(
            padding: EdgeInsets.all(10),
            child: _text('${bmi.toStringAsFixed(2)}',
                fontSize: 50, color: bmiClassification['color']),
          ),
          _text(bmiClassification['message'], textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
