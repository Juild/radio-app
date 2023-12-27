import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:radio_app/repositories/models/failure.dart';
import 'models/radio.dart';

abstract class IRadioRepository {
  Future<Either<Failure, List<AppRadio>>> getRadios({required String countryCode});
}

class RadioRepository implements IRadioRepository {
  @override
  Future<Either<Failure, List<AppRadio>>> getRadios({required String countryCode}) async {
    try {
      final url = Uri.http(
        'at1.api.radio-browser.info',
        '/json/stations/search',
        {'countrycode': countryCode}, // Query parameters
      );
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(utf8.decode(response.bodyBytes));
        return right(body.map((e) => AppRadio.fromJson(e)).toList());
      } else {
        return left(Failure('Failed to load radios'));
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
