import 'package:cities_manager/entities/city.dart';
import 'package:flutter/material.dart';

class CityForm extends StatefulWidget {
  final void Function({String name, String uf}) handleFormSubmit;
  final City city;

  CityForm({@required this.handleFormSubmit, this.city});

  @override
  _CityFormState createState() => _CityFormState();
}

class _CityFormState extends State<CityForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _ufController;

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

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.city?.name ?? null);
    _ufController = TextEditingController(text: widget.city?.uf ?? null);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ufController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                return;
              }

              widget.handleFormSubmit(
                  name: _nameController.text, uf: _ufController.text);
            },
          ),
        ],
      ),
    );
  }
}
