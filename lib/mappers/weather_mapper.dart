import 'package:api_dio_test/models/weather_model.dart';
import 'package:api_dio_test/models/weather_response_model.dart';

extension WeatherResponseMapper on WeatherApiResponseModel {
  WeatherModel toEntity() => WeatherModel(
        lat: coord?.lat ?? 0,
        long: coord?.lon ?? 0,
        main: weather?[0].main ?? "",
        description: weather?[0].description ?? "",
        id: weather?[0].id ?? 0,
        name: name ?? '',
      );
}

