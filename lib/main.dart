import 'package:api_dio_test/di/injection_container.dart';
import 'package:api_dio_test/pages/weather_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherPage(),
    );
  }
}
