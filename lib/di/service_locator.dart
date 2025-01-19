import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hackaton/viewModel/data/repositories/repository_impl.dart';
import 'package:hackaton/viewModel/providers/weather_provider.dart';

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
