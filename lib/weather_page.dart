// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, prefer_final_fields, empty_catches

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'api_service_weather.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  WeatherService _weatherService = WeatherService();
  Weather? _weather;

  void fetchWeather() async {
    try {
      _weather = await _weatherService.getCurrentWeather();
      setState(() {});
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima RD'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.blueGrey[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: fetchWeather,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Ver el clima',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              if (_weather != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fecha: ${_weather!.date}'),
                    Text('Condicion: ${_weather!.weatherDescription}'),
                    Text('Temperatura: ${_weather!.temperature?.celsius}°C'),
                    Text(
                        'Temperatura minima: ${_weather!.tempMin?.celsius}°C'),
                    Text(
                        'Temperatura maxima: ${_weather!.tempMax?.celsius}°C'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
