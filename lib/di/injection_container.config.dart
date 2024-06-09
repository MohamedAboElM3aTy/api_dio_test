// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_dio_test/cubit/weather_cubit.dart' as _i4;
import 'package:api_dio_test/repository/weather_repository.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.WeatherRepository>(
      () => _i3.WeatherRepositoryImplementation());
  gh.factory<_i4.WeatherCubit>(
      () => _i4.WeatherCubit(gh<_i3.WeatherRepository>()));
  return getIt;
}
