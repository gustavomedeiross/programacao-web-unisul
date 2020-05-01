import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 300,
                      ),
                      child: Container(
                        //color: Colors.blue[50],
                        child: Image.network(
                            "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
                      ),
                    ),
                    Text(
                      "Renault Megane RS Trophy",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
