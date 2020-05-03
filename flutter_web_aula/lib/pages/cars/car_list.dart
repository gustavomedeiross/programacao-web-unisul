import 'package:flutter/material.dart';
import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/models/car.dart';
import 'package:flutter_web_aula/models/custom_navigator.dart';
import 'package:flutter_web_aula/pages/cars/car_detail.dart';
import 'package:flutter_web_aula/repositories/car_repository.dart';
import 'package:provider/provider.dart';

class CarPage extends StatefulWidget {
  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final _carRepository = CarRepository();

  _handleCarClick(Car car) {
    AppModel app = Provider.of<AppModel>(context, listen: false);
    app.setNavigation(CustomNavigator(title: car.name ?? 'Detalhes', page: CarDetailPage(context, car)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _carRepository.getCars(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!(snapshot.connectionState == ConnectionState.done)) {
          throw UnimplementedError();
        }

        if (snapshot.hasError) {
          throw UnimplementedError();
        }

        if (!snapshot.hasData) {
          throw UnimplementedError();
        }

        List<Car> cars = snapshot.data;

        return GridView.builder(
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
                          builder: (context) => CarDetailPage(context, car),
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
                            child: Image.network(car.image ?? "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png"),
                          ),
                        ),
                        Text(
                          car.name ?? 'N/A',
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
        );

      },
    );
  }
}
