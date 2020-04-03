import 'package:address_finder/models/address.dart';
import 'package:address_finder/pages/results.dart';
import 'package:address_finder/repositories/address_repository.dart';
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

  void handlePress() {
    String cep = _cepController.text;
    cep = cep.replaceAll('-', '');
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => Results(
              cep: cep,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 350,
                //   child: Lottie.network(
                //       // 'https://assets3.lottiefiles.com/packages/lf20_bKoLdP.json'
                //       // 'https://assets2.lottiefiles.com/datafiles/wW9k6ALg5Mn9cIj/data.json'),
                // ),
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
              TextField(
                controller: _cepController,
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
                  onPressed: () => handlePress(),
                  child: Text('Buscar dados de endereço'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
