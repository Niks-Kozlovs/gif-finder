import 'dart:io';

import 'package:gif_finder/model/gif.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gif_finder/util/constants.dart';
import 'dart:convert';

import 'api_status.dart';

class GifService {
  static Future<Object> getGifs(String search, [int offset = 0]) async {
    try {
      var url = Uri.parse(
          '$gifSearchURL?api_key=${dotenv.env['GIPHY_API_KEY']}&limit=$objectLimit&q=$search&offset=$offset');
      final response = await http.get(url);
      var body = json.decode(response.body);
      var meta = body['meta'];
      if (response.statusCode == 200 && meta['status'] == 200) {
        final response = {
          'gifs': gifFromJson(body['data']),
          'count': body['pagination']['total_count'],
        };
        return Success(response: response);
      }

      if (meta['status'] != 200) {
        return Failure(code: meta['status'], errorResponse: meta['msg']);
      }

      return Failure(code: userInvalidResponse, errorResponse: 'Invalid response');
    } on HttpException {
      return Failure(code: noInternetConnection, errorResponse: 'No internet connection');
    } on FormatException {
      return Failure(code: invalidFormat, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: unknownError, errorResponse: 'Invalid response');
    }
  }
}
