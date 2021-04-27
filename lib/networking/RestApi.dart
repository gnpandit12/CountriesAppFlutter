import 'dart:convert';

import 'package:countries_app_flutter/model/CountriesModel.dart';
import 'package:dio/dio.dart';

Future<List<CountriesModel>> getCountriesFromRegion(String regionString) async {
  print("Selected Region: ${regionString}");

  var _dio = new Dio();
  var options = new Options();
  options.contentType = 'application/json';
  String url = "https://restcountries.eu/rest/v2/";
  Map<String, String> qParams = {
    'region': regionString,
  };

  var response =
      await _dio.get(url, options: options, queryParameters: qParams);

  print("Response: ${response}");
  List<CountriesModel> countriesResponse;

  print("Response Code: ${response.statusCode.toString()}");
  if (response.statusCode == 200) {
    print("Response Successful!");
    final Map parsed = json.decode(response.data);
    print("Post request map: ${parsed.toString()}");
    countriesResponse = CountriesModel.fromJson(parsed) as List<CountriesModel>;
  } else {
    print("Response Failed!");
    throw Exception('Failed to fetch data');
  }
  print("Response status: ${response.statusCode.toString()}");
  print("Response body: ${response.data.toString()}");
  return countriesResponse;
}
