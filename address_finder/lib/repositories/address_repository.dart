import 'dart:convert';

import 'package:address_finder/models/address.dart';
import 'package:address_finder/services/api.dart';
import 'package:http/http.dart' as http;

class AddressRepository {
  Future<Address> getAddressByCep(String cep) async {
    final http.Response response = await http.get(api + cep + '/json');

    await Future.delayed(Duration(seconds: 2));

    return Address.fromJson(json.decode(response.body));
  }
}
