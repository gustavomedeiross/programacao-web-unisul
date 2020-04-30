import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context)=>AppModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        home: HomePage(),
      ),
    );
  }

  _theme() {
    return ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.blue,
        hoverColor: Colors.blue[100],
        textTheme: TextTheme(
          body1: TextStyle(
          fontSize: 22,
        ),
    ),
    );
  }
}