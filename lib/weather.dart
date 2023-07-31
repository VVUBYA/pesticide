import 'package:flutter/material.dart';

class WeatherUpdate {
  final String date;
  final String description;
  final String temperature;

  WeatherUpdate({
    required this.date,
    required this.description,
    required this.temperature,
  });
}

class WeatherUpdatesScreen extends StatelessWidget {
  // Sample weather updates data
  final List<WeatherUpdate> weatherUpdates = [
    WeatherUpdate(
      date: "July 28, 2023",
      description: "Partly cloudy with a chance of showers",
      temperature: "25°C",
    ),
    WeatherUpdate(
      date: "July 29, 2023",
      description: "Sunny and clear skies",
      temperature: "30°C",
    ),
    WeatherUpdate(
      date: "July 30, 2023",
      description: "Thunderstorms expected in the afternoon",
      temperature: "22°C",
    ),
    // Add more weather updates as needed...
  ];

  WeatherUpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Updates'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: weatherUpdates.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.cloud),
            title: Text(weatherUpdates[index].date),
            subtitle: Text(weatherUpdates[index].description),
            trailing: Text(weatherUpdates[index].temperature),
          );
        },
      ),
    );
  }
}
