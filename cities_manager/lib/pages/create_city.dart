import 'package:flutter/material.dart';

class CreateCityPage extends StatefulWidget {
  @override
  _CreateCityPageState createState() => _CreateCityPageState();
}

class _CreateCityPageState extends State<CreateCityPage> {
  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cidades'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Teste'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
