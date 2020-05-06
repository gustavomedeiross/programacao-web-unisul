import 'package:flutter/material.dart';
import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/models/car.dart';
import 'package:flutter_web_aula/models/custom_navigator.dart';
import 'package:flutter_web_aula/pages/cars/show.dart';
import 'package:flutter_web_aula/pages/cars/create.dart';
import 'package:flutter_web_aula/repositories/car_repository.dart';
import 'package:provider/provider.dart';

class CarIndexPage extends StatefulWidget {
  @override
  _CarIndexPageState createState() => _CarIndexPageState();
}

class _CarIndexPageState extends State<CarIndexPage> {
  final _carRepository = CarRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _carRepository.index(),
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

        return Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                AppModel app = Provider.of<AppModel>(context, listen: false);
                app.setNavigation(CustomNavigator(title: 'Cadastrar Carro', page: CarCreate()));
              },
              child: Text('Cadastrar Carro'),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
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
                            AppModel app = Provider.of<AppModel>(this.context, listen: false);
                            app.setNavigation(CustomNavigator(title: car.name ?? 'Detalhe de carro', page: CarShowPage(car)));
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
              ),
            ),
          ],
        );

      },
    );
  }
}
