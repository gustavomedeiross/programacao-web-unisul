import 'package:address_finder/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal,
          brightness: Brightness.dark,
          accentColor: Colors.teal),
      home: Home(),
    );
  }
}

//#71B7E3
const MaterialColor primaryColor = const MaterialColor(
  0xFF71B7E3,
  const <int, Color>{
    50: const Color(0xFF71B7E3),
    100: const Color(0xFF71B7E3),
    200: const Color(0xFF71B7E3),
    300: const Color(0xFF71B7E3),
    400: const Color(0xFF71B7E3),
    500: const Color(0xFF71B7E3),
    600: const Color(0xFF71B7E3),
    700: const Color(0xFF71B7E3),
    800: const Color(0xFF71B7E3),
    900: const Color(0xFF71B7E3),
  },
);
