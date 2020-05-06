import 'package:flutter/material.dart';
import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/models/car.dart';
import 'package:provider/provider.dart';

class CarShowPage extends StatefulWidget {
  final Car car;

  const CarShowPage(this.car);

  @override
  _CarShowPageState createState() => _CarShowPageState();
}

class _CarShowPageState extends State<CarShowPage> {
  _handleClick() {
    AppModel app = Provider.of<AppModel>(this.context, listen: false);
    app.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(widget.car.image),
          Text(
            widget.car.name ?? ' ',
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.car.description ?? ' ',
            overflow: TextOverflow.ellipsis,
          ),
          RaisedButton(
            child: Text('Voltar'),
            onPressed: _handleClick,
          )
        ],
      ),
    );
  }
}
