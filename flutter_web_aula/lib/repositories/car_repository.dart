import 'package:flutter/cupertino.dart';
import 'package:flutter_web_aula/models/car.dart';
import 'package:flutter_web_aula/models/user.dart';
import 'package:flutter_web_aula/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CarRepository {
  index() async {
    final String url = 'https://carros-springboot.herokuapp.com/api/v2/carros';

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    });

    List rawCars = json.decode(response.body);

    var cars = rawCars.map<Car>((car) => Car.fromJson(car)).toList();
    return cars;
  }

  store(BuildContext context, Car car) async {
    try {
      String url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
      String body = json.encode(car.toJson());

      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user.token}',
      });

      Map decodedResponse = json.decode(response.body);

      if(response.statusCode == 201) {
        Car car = Car.fromJson(decodedResponse);
        return ApiResponse.ok();
      }

      return ApiResponse.error(message: decodedResponse['error']);
    } catch (error, exception) {
      return ApiResponse.error(message: 'Não foi possível cadastrar o carro');
    }
  }
}