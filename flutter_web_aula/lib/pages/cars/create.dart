import 'package:flutter/material.dart';
import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/models/car.dart';
import 'package:flutter_web_aula/models/custom_navigator.dart';
import 'package:flutter_web_aula/repositories/car_repository.dart';
import 'package:flutter_web_aula/utils/alert.dart';
import 'package:flutter_web_aula/utils/api_response.dart';
import 'package:flutter_web_aula/widgets/upload.dart';
import 'package:provider/provider.dart';

class CarCreate extends StatefulWidget {
  @override
  _CarCreateState createState() => _CarCreateState();
}

class _CarCreateState extends State<CarCreate> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _type = 'Clássico';
  final _imageController = TextEditingController();

  final _carRepository = CarRepository();

  String _requiredValidator(String text) {
    if (text.isEmpty) {
      return 'O campo é obrigatório';
    }

    return null;
  }

  Widget _textFormField(
      {String label,
      String hint,
      TextEditingController controller,
      Function(String) validator,
      bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        labelText: label,
        labelStyle: TextStyle(fontSize: 20, color: Colors.black),
        hintText: hint,
      ),
    );
  }

  _button(String text, {onPressed}) {
    return Container(
      height: 50,
      width: 250,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: onPressed,
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _handleCancelClick() {
    AppModel app = Provider.of<AppModel>(context, listen: false);
    app.pop();
  }

  _handleRegisterClick() async {
    if(!_formKey.currentState.validate()) {
      return;
    }

    Car car = Car();
    car.name = _nameController.text;
    car.description = _descriptionController.text;
    car.type = _type;
    car.image = _imageController.text;

    ApiResponse response = await _carRepository.store(car);

    if (response.ok) {
      alert(context, 'Carro Salvo com sucesso', 'Cadastro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: this._formKey,
        child: ListView(
          children: <Widget>[
//            _textFormField(
//              label: 'Tipo',
//              hint: 'Clássico, Esportivo ou Luxo',
//              controller: _typeController,
//              validator: _requiredValidator
//            ),
          DropdownButton<String>(
            value: _type,
            underline: Container(height: 1, color: Colors.black38,),
            onChanged: (String selectedValue) {
              setState(() {
                _type = selectedValue;
              });
            },
            items: <String>['Clássico', 'Esportivo', 'Luxo'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
            _textFormField(
                label: 'Nome',
                hint: 'Nome do Carro',
                controller: _nameController,
                validator: _requiredValidator
            ),
            Divider(),
            _textFormField(
                label: 'Descrição',
                hint: 'Descrição do Carro',
                controller: _descriptionController,
                validator: _requiredValidator
            ),
            SizedBox(
              height: 20,
            ),
            UploadInput(controller: _imageController,),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                _button('Cancelar', onPressed: _handleCancelClick),
                SizedBox(
                  width: 30,
                ),
                _button('Cadastrar', onPressed: _handleRegisterClick)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
