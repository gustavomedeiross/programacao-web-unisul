import 'package:flutter/material.dart';
import 'package:flutter_web_aula/models/car_model.dart';

class CarDetailPage extends StatelessWidget {
  final CarModel car;

  const CarDetailPage(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.height * .7,
          child: Card(
            color: Colors.deepPurple[400],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.network(car.image),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Container(
                        child: Text(car.name),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        child: Text(car.model),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        child: Text(car.color),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        alignment: Alignment.centerRight,
                        child: Text(car.price),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
