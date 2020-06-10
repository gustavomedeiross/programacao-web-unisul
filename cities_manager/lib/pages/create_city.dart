import 'package:cities_manager/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:cities_manager/entities/city.dart';
import 'package:cities_manager/repositories/city_repository.dart';

class CreateCityPage extends StatefulWidget {
  @override
  _CreateCityPageState createState() => _CreateCityPageState();
}

class _CreateCityPageState extends State<CreateCityPage> {
  final _formKey = GlobalKey<FormState>();
  final _cityRepository = CityRepository();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ufController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ufController.dispose();
    super.dispose();
  }

  String _nameValidator(String value) {
    if (value == null) {
      return 'O nome da cidade não pode ser vazio';
    }

    return null;
  }

  String _ufValidator(String value) {
    if (value == null) {
      return 'É necessário uma UF da cidade';
    }

    return null;
  }

  void _handleFormSubmit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    final city = City(name: _nameController.text, uf: _ufController.text);

    await _cityRepository.store(city);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Cidade'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome da Cidade'),
                controller: _nameController,
                validator: _nameValidator,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'UF'),
                controller: _ufController,
                validator: _ufValidator,
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text('Cadastrar'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: _handleFormSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
