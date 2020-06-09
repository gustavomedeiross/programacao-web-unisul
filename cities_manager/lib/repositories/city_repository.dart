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

  void store(City city) async {
    await http.post(API_URL + '/cities', body: city.toJson());
  }
}
