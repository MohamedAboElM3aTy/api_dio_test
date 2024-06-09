import 'package:api_dio_test/cubit/weather_cubit.dart';
import 'package:api_dio_test/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final WeatherCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<WeatherCubit>()..getWeather('london');
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Weather apI'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: _cubit,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(
              child: Text('OR else happened'),
            ),
            error: (message) => Center(child: Text(message)),
            loading: () => const CircularProgressIndicator.adaptive(),
            loaded: (weather) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(weather.main),
                  const Gap(10),
                  Text(weather.lat.toString()),
                  const Gap(10),
                  Text(weather.long.toString()),
                  const Gap(10),
                  Text(weather.description),
                  const Gap(10),
                  Text(weather.id.toString()),
                  const Gap(10),
                  Text(weather.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
