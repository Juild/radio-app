import 'dart:convert';

import 'models/radio.dart';
import 'package:http/http.dart' as http;

abstract class IRadioRepository {
  Future<List<AppRadio>> getRadios({required String countryCode});
}

class RadioRepository implements IRadioRepository {
  @override
  Future<List<AppRadio>> getRadios({required String countryCode}) async {
    final url = Uri.http(
      'at1.api.radio-browser.info',
      '/json/stations/search',
      {'countrycode': countryCode}, // Query parameters
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(utf8.decode(response.bodyBytes));
      return body.map((e) => AppRadio.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
