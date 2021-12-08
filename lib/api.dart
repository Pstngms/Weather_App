import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'models/weather.dart';

Future<List<Hourly>?> getCurrentWeather() async {
  Current? weather;
  var params = {
    'lat': '60',
    'lon': '30',
    'appid': 'f23bbb81b90fac4f08fd40fc584de217',
    'units': 'metric',
    'exclude': 'minutely,alerts',
  };
  final endpoint =
  Uri.https('api.openweathermap.org','/data/2.5/onecall', params);
  final response = await http.get(endpoint);
  if (response.statusCode == 200) {
    //print(response.body);
    log('loaded');
    var respJson = json.decode(response.body);
    // log(json.toString());
    weather = Current.fromJson(jsonDecode(response.body));
    log('return');
    log(respJson['hourly'].length.toString());
    log(respJson['hourly'][0].toString());
    var result = respJson['hourly'].map((el) {
      log(el['dt'].toString());
      return Hourly.fromJson(el);
    }).toList();
    log('return2');
    return result;
    // log(json['hourly']);
    // for (var h in json['hourly']){
    //   log(h.toString());
    //   hourly.add(Hourly.fromJson(h));
    // }
  } else {
    //
  }
  //print(response.body);

  return null;
}

