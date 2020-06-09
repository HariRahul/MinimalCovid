///The commented part is required when we don't need to dynamically access object properties.

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//import 'count.dart';

Future<String> fetchAlbum(String stateChoice) async {

  var url = 'https://api.covid19india.org/states_daily.json';

  var response = await http.get(url);

  if (response.statusCode == 200) {

    var jsonResponse = convert.jsonDecode(response.body);

    List b = jsonResponse['states_daily'] as List;
    //List list = b.map<StatesDaily>((json) => StatesDaily.fromJson(json)).toList();

    return b[b.length-3][stateChoice];

  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  return "Unable to fetch data";
}