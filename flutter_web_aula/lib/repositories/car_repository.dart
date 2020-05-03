import 'dart:convert';

import 'package:flutter_web_aula/models/car.dart';
import 'package:http/http.dart' as http;

class CarRepository {
  getCars() async {
    final String url = 'https://carros-springboot.herokuapp.com/api/v1/carros';

    final response = await http.get(url);
    List rawCars = json.decode(response.body);

    var cars = rawCars.map<Car>((car) => Car.fromJson(car)).toList();
    return cars;
  }
}