import 'package:flutter/material.dart';

class PaginaDefault extends StatefulWidget {
  @override
  _PaginaDefaultState createState() => _PaginaDefaultState();
}

class _PaginaDefaultState extends State<PaginaDefault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
