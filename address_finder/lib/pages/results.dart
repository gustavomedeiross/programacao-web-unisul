import 'package:address_finder/models/address.dart';
import 'package:address_finder/repositories/address_repository.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Results extends StatelessWidget {
  AddressRepository _addressRepository = AddressRepository();

  final String cep;

  Results({@required this.cep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('oi')),
      body: Center(
        child: FutureBuilder(
            future: _addressRepository.getAddressByCep(cep),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                return Text('erro');
              }

              if (!snapshot.hasData) {
                return Lottie.network(
                    'https://assets2.lottiefiles.com/datafiles/wW9k6ALg5Mn9cIj/data.json');
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('A imagem vai aqui (talvez lottie)'),
                  Text('CEP: ${snapshot.data.cep}'),
                  Text('Cidade: ${snapshot.data.city}')
                ],
              );
            }),
      ),
    );
  }
}
