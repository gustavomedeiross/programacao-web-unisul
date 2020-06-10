import 'dart:convert';

import 'package:cities_manager/entities/city.dart';
import 'package:http/http.dart' as http;
import 'package:cities_manager/services/api.dart';

class CityRepository {
  Future<List<City>> index() async {
    final http.Response response = await http.get(API_URL + '/cities');
    List jsonCities = json.decode(response.body);
    return jsonCities.map<City>((city) => City.fromJson(city)).toList();
  }

  Future<http.Response> store(City city) async {
    final body = json.encode(city.toJson());

    final response = await http.post(API_URL + '/cities', body: body, headers: {
      'Content-Type': 'application/json',
    });

    return response;
  }
}
