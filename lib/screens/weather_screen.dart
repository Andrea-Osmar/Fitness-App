import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/weather.dart';
import 'package:flutter_application_1/shared/menu_bottom.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        bottomNavigationBar: const MenuBottom(),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                      hintText: 'Enter a city',
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.search), onPressed: getData),
                    ),
                  ),
                ),
                weatherRow('City: ', result.name),
                weatherRow('Description: ', result.description),
                weatherRow('Temperature: ',
                    result.temperature.toStringAsFixed(2) + '°C'),
                weatherRow(
                    'Perceived: ', result.perceived.toStringAsFixed(2) + '°C'),
                weatherRow('Pressure: ', result.pressure.toString()),
                weatherRow('Humidity: ', result.humidity.toString()),
              ],
            )));
  }

//textfield
  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

//function returning a widget
  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(children: [
          Expanded(
              flex: 3,
              child: Text(label,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).hintColor))),
          Expanded(
              flex: 4,
              child: Text(value,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).hintColor)))
        ]));
    return row;
  }
}
