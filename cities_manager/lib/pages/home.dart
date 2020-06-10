import 'package:flutter/material.dart';
import 'package:cities_manager/entities/city.dart';
import 'package:cities_manager/repositories/city_repository.dart';
import 'package:cities_manager/pages/create_city.dart';

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
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateCityPage())).then((value) => setState(() => {})),
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
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext _, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        '${snapshot.data[index].name} - ${snapshot.data[index].uf}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => print('edit'),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => print('delete'),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
