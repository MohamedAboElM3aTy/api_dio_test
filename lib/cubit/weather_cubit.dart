import 'package:api_dio_test/models/weather_model.dart';
import 'package:api_dio_test/repository/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(const WeatherState.initial());

  Future<void> getWeather(String cityName) async {
    emit(const WeatherState.loading());
    final weather = await _weatherRepository.getWeather(cityName);
    if (weather != null) {
      emit(WeatherState.loaded(weather: weather));
    } else {
      emit(const WeatherState.error(message: "Failed to fetch weather"));
    }
  }
}
