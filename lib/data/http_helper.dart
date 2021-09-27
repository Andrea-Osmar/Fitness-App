import 'package:http/http.dart' as http;
import 'dart:convert';

import 'weather.dart';

class HttpHelper {
//http://api.openweathermap.org/data/2.5/weather?q=London&appid=38d8ead396b75510c605134ba40b95f7
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '38d8ead396b75510c605134ba40b95f7';

//method
  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);

    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    // weather object called weather
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
