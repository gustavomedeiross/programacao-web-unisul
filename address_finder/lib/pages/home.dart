import 'package:address_finder/helpers/address_helper.dart';
import 'package:address_finder/pages/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MaskedTextController _cepController =
      MaskedTextController(mask: '00000-000');

  final _formKey = GlobalKey<FormState>();

  String _cepValidator(String val) {
    if (val.isEmpty) {
      return 'O CEP é o obrigatório';
    }

    if (AddressHelper.getRawCepValue(val).length < 8) {
      return 'Informe o CEP completo';
    }

    return null;
  }

  void handlePress() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String cep = _cepController.text;
    cep = AddressHelper.getRawCepValue(cep);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => Results(
              cep: cep,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 350,
                    child: Lottie.network(
                        'https://assets4.lottiefiles.com/private_files/lf30_f14pGc.json'),
                  ),
                  Text(
                    'Digite o seu CEP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _cepController,
                    validator: _cepValidator,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ex: 99988-777',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: handlePress,
                      child: Text('Buscar dados de endereço'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
