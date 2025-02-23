import 'dart:developer';

import 'package:Weather/constants/api_constants.dart';
import 'package:Weather/model/forecast_model.dart';
import 'package:Weather/viewModel/domain/repository/app_repository.dart';
import 'package:dio/dio.dart';

class RepositoryImpl implements AppRepository {
  final Dio _dio;

  RepositoryImpl()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.BASE_URL,
            headers: {
              'Content-Type': "application/json",
            },
          ),
        );

  @override
  Future<ForecastModel?> fetchForecastData(String cityName) async {
    try {
      final response = await _dio.get(
          "https://api.weatherapi.com/v1/forecast.json?q=tashkent&days=7&key=27a4f823b3e3409eb6132909251001");

      //${ApiConstants.BASE_URL}?q=${cityName.toLowerCase()}&days=7&key=${ApiConstants.API_KEY}

      log("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        log(response.data.toString());
        final data = ForecastModel.fromJson(response.data);
        return data;
      } else {
        throw Exception(
            "Failed to fetch forecast weather data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
