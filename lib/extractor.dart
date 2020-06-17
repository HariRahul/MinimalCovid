///The commented part is required when we don't need to dynamically access object properties.

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//import 'count.dart';

Future<Map<String, dynamic>> fetchStates() async {

  var url = 'https://api.covid19india.org/states_daily.json';

  var response = await http.get(url);

  if (response.statusCode == 200) {

    var jsonResponse = convert.jsonDecode(response.body);

    List b = jsonResponse['states_daily'] as List;
    //List list = b.map<StatesDaily>((json) => StatesDaily.fromJson(json)).toList();

    return b[b.length-3];

  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future<Map<String, dynamic>> fetchDistricts() async {

  var url = 'https://api.covid19india.org/districts_daily.json';

  var response = await http.get(url);

  if (response.statusCode == 200) {

    var jsonResponse = convert.jsonDecode(response.body);

    return jsonResponse['districtsDaily'];

  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future<Map<String, dynamic>> fetchData() async {

  var url = 'https://api.covid19india.org/v3/data.json';

  var response = await http.get(url);

  if (response.statusCode == 200) {

    var jsonResponse = convert.jsonDecode(response.body);

    return jsonResponse;

  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}