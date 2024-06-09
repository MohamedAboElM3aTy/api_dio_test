import 'package:api_dio_test/constants/app_constants.dart';
import 'package:api_dio_test/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class WeatherRepository {
  Future<WeatherModel?> getWeather(String cityName);
}

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImplementation implements WeatherRepository {
  final Dio _dio = Dio();
  @override
  Future<WeatherModel?> getWeather(String cityName) async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}/weather?q=$cityName&appid=${AppConstants.apiKey}',
      );
      final result = WeatherModel.fromMap(response.data);
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
