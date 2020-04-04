import 'package:address_finder/helpers/address_helper.dart';
import 'package:address_finder/models/address.dart';
import 'package:address_finder/repositories/address_repository.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Results extends StatelessWidget {
  AddressRepository _addressRepository = AddressRepository();

  final String cep;

  Results({@required this.cep});

  Text _text(String text) {
    return Text(
      text,
    );
  }

  TableRow _tableRow(String key, String value, BuildContext context,
      {bool isTableHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isTableHeader
            ? Color(0xFF666666).withOpacity(0.2)
            : Color(0xFF666666).withOpacity(0.4),
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: _text(key),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: _text(value.length > 0 ? value : 'N/A'),
        ),
      ],
    );
  }

  Widget _table(BuildContext context, Address address) {
    Map<String, dynamic> addressMap = address.toMap();

    List<TableRow> addressTableRows = addressMap.entries.map((e) {
      return _tableRow(AddressHelper.getLabels(e.key), e.value, context);
    }).toList();

    return Table(
      children: <TableRow>[
        _tableRow('Campo', 'Valor', context, isTableHeader: true),
        ...addressTableRows
      ],
      border: TableBorder(
          horizontalInside: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor, width: 2.5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infomações do Endereço'),
      ),
      body: Center(
        child: FutureBuilder(
            future: _addressRepository.getAddressByCep(cep),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Lottie.network(
                    'https://assets2.lottiefiles.com/datafiles/wW9k6ALg5Mn9cIj/data.json');
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Lottie.network(
                          'https://assets6.lottiefiles.com/packages/lf20_4azG0q.json',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Text(
                          'Oops, verifique as suas credenciais e tente novamente!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).errorColor,
                              fontSize: 16),
                        ),
                      )
                    ],
                  );
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: _table(context, snapshot.data),
                    )
                  ],
                );
              }
            }),
      ),
    );
  }
}
