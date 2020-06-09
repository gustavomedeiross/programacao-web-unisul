import 'package:cities_manager/entities/city.dart';
import 'package:cities_manager/repositories/city_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CityRepository _cityRepository = CityRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cidades'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print('hello'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _cityRepository.index(),
        builder: (BuildContext _, AsyncSnapshot<List<City>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Erro!'),
            );
          }

          return Container(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext _, int index) {
                return Card(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '${snapshot.data[index].name} - ${snapshot.data[index].uf}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
