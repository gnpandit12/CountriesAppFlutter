import 'dart:convert';

import 'package:countries_app_flutter/model/CountriesModel.dart';
import 'package:http/http.dart' as http;

var apiUrl = Uri.parse('https://restcountries.eu/rest/v2/region/');

Future<CountriesModel> getCountriesFromRegion(String regionString) async {
  Map region = {'region': regionString};
  var body = json.encode(region);
  var response = await http.post(apiUrl, body: body);

  CountriesModel countriesResponse;

  print("Response Code: ${response.statusCode.toString()}");
  if (response.statusCode == 200) {
    print("Response Successful!");
    final Map parsed = json.decode(response.body);
    countriesResponse = CountriesModel.fromJson(parsed);
  } else {
    print("Response Failed!");
    throw Exception('Failed to fetch data');
  }
  print("Api_Url: ${apiUrl.toString()}");
  print("Response status: ${response.statusCode.toString()}");
  print("Response body: ${response.body.toString()}");
  return countriesResponse;
}
