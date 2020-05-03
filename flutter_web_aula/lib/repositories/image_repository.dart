import 'dart:convert';

import 'package:flutter_web_aula/utils/api_response.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<ApiResponse<String>> store(String fileName, String mimeType, String base64) async {
      try {
        final String url = 'https://carros-springboot.herokuapp.com/api/v1/upload';

        Map params = {
          'fileName': fileName,
          'mimeType': mimeType,
          'base64': base64,
        };

        final body = json.encode(params);

        final response = await http.post(url, headers: {
          'content-type': 'application/json',
        }, body: body).timeout(Duration(seconds: 120), onTimeout: () => throw Exception('Erro ao se comunicar com o servidor'));

        String imageUrl = json.decode(response.body)['url'];

        return ApiResponse.ok(result: imageUrl);
      } catch (error, exception) {
        return ApiResponse.error(message: 'Não foi possível fazer o upload');
      }
  }
}
