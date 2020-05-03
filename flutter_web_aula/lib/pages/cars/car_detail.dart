import 'package:flutter/material.dart';
import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/models/car.dart';
import 'package:provider/provider.dart';

class CarDetailPage extends StatelessWidget {
  final BuildContext context;
  final Car car;

  const CarDetailPage(this.context, this.car);

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
          Image.network(car.image),
          Text(
            car.name ?? ' ',
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            car.description ?? ' ',
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
