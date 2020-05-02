import 'package:flutter/material.dart';
import 'package:flutter_web_aula/models/car.dart';
import 'package:flutter_web_aula/pages/cars/car_detail.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final List<Car> cars = [
    Car(
      name: 'Citroen Creative Technology',
      color: 'Preto',
      model: 'Mustang',
      price: 'R\$ 1.000,00',
    ),
    Car(
      name: 'Citroen Creative Technology',
      color: 'Preto',
      model: 'Mustang',
      price: 'R\$ 1.000,00',
    ),
    Car(
      name: 'Citroen Creative Technology',
      color: 'Preto',
      model: 'Mustang',
      price: 'R\$ 1.000,00',
    ),
    Car(
      name: 'Citroen Creative Technology',
      color: 'Preto',
      model: 'Mustang',
      price: 'R\$ 1.000,00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: cars.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          Car car = cars[index];
          return LayoutBuilder(
            builder: (context, constraints) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailPage(car),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 300,
                        ),
                        child: Container(
                          child: Image.network(car.image),
                        ),
                      ),
                      Text(
                        car.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
