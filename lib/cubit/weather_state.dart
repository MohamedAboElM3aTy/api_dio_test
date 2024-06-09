part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;

  const factory WeatherState.loading() = _Loading;

  const factory WeatherState.loaded({required WeatherModel weather}) = _Loaded;

  const factory WeatherState.error({required String message}) = _Error;
}
