import 'dart:developer';

import 'package:Weather/viewModel/data/repositories/repository_impl.dart';
import 'package:Weather/viewModel/providers/weather_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  try {
    sl.registerLazySingleton<RepositoryImpl>(
      () => RepositoryImpl(),
    );

    sl.registerFactory(
      () => WeatherProvider(
        repo: sl<RepositoryImpl>(),
      ),
    );
  } catch (e) {
    log("Service registration error: $e");
  }
}
