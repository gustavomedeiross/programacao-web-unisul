import 'package:flutter/material.dart';
import 'package:cities_manager/entities/city.dart';
import 'package:cities_manager/repositories/city_repository.dart';
import 'package:cities_manager/widgets/city_form.dart';

class UpdateCityPage extends StatefulWidget {
  final City city;
  UpdateCityPage({ this.city });

  @override
  _UpdateCityPageState createState() => _UpdateCityPageState();
}

class _UpdateCityPageState extends State<UpdateCityPage> {
  final _cityRepository = CityRepository();

  void _handleFormSubmit({ String name, String uf }) async {
    final city = City(name: name, uf: uf);
    await _cityRepository.update(city, widget.city.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Cidade'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: CityForm(handleFormSubmit: _handleFormSubmit, city: widget.city),
      ),
    );
  }
}
