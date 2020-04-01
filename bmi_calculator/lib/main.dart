import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
        accentColor: secondaryColor,
      ),
      home: Home(),
    );
  }
}

// b1cfce
//#03AD93
//#006A58
const MaterialColor primaryColor = const MaterialColor(
  0xFF03AD93,
  const <int, Color>{
    50: const Color(0xFF03AD93),
    100: const Color(0xFF03AD93),
    200: const Color(0xFF03AD93),
    300: const Color(0xFF03AD93),
    400: const Color(0xFF03AD93),
    500: const Color(0xFF03AD93),
    600: const Color(0xFF03AD93),
    700: const Color(0xFF03AD93),
    800: const Color(0xFF03AD93),
    900: const Color(0xFF03AD93),
  },
);

const MaterialColor secondaryColor = const MaterialColor(
  0xFF006A58,
  const <int, Color>{
    50: const Color(0xFF006A58),
    100: const Color(0xFF006A58),
    200: const Color(0xFF006A58),
    300: const Color(0xFF006A58),
    400: const Color(0xFF006A58),
    500: const Color(0xFF006A58),
    600: const Color(0xFF006A58),
    700: const Color(0xFF006A58),
    800: const Color(0xFF006A58),
    900: const Color(0xFF006A58),
  },
);
