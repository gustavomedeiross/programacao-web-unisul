import 'package:flutter/material.dart';
import 'package:flutter_web_aula/widgets/web_utils.dart';

class PaginaDefault extends StatefulWidget {
  @override
  _PaginaDefaultState createState() => _PaginaDefaultState();
}

class _PaginaDefaultState extends State<PaginaDefault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5),
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, constraints) {
              double tamanhoFonte = tamanho(
                constraints.maxWidth * 0.07,
                minimo: 8,
                maximo: Theme.of(context).textTheme.body1.fontSize,
              );
              int x = tamanhoFonte.toInt();
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
                      "$x - Renault Megane RS Trophy",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: tamanhoFonte),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
