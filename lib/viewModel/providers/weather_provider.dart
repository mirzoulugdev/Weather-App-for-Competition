import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackaton/model/current_weather_model.dart';
import 'package:hackaton/model/forecast_model.dart';
import 'package:hackaton/viewModel/data/repositories/repository_impl.dart';

class WeatherProvider extends ChangeNotifier {
  final RepositoryImpl repo;

  WeatherProvider({required this.repo});

  bool isLoading = false;
  bool hasError = false;
  String errorMessage = "";
  String address = "Unknown";

  CurrentWeatherModel? currentWeather;
  ForecastModel? forecastWeather;

  void resetState() {
    isLoading = false;
    hasError = false;
    errorMessage = "";
    currentWeather = null;
    forecastWeather = null;
    address = "Unknown";
    notifyListeners();
  }

  Future<Position> determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled. Please enable them.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception(
              'Location permissions are denied. Grant permission to use the app.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied. Enable them in your device settings.');
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      log("Error determining position: $e");
      throw Exception("Failed to determine position: $e");
    }
  }

  Future<void> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        address =
            "${place.locality ?? "Unknown"}, ${place.administrativeArea ?? "Unknown"}, ${place.country ?? "Unknown"}";
        log("Address fetched: $address");
      } else {
        address = "Unknown location";
        log("Address could not be determined.");
      }
      notifyListeners();
    } catch (e) {
      log("Error getting address: $e");
      throw Exception("Failed to fetch address.");
    }
  }

  Future<void> getForecastWeatherData([String cityName = 'tashkent']) async {
    String name;
    try {
      // log("Fetching forecast for: $address");
      if (cityName != null) {
        name = address;
      } else {
        name = cityName!.toLowerCase();
      }
      final result = await repo.fetchForecastData(name);
      if (result != null) {
        forecastWeather = result;
        // log("Forecast data fetched.");
        log(forecastWeather.toString());
      } else {
        throw Exception("No forecast data found.");
      }
      notifyListeners();
    } catch (e) {
      // log("Error fetching forecast weather data: $e");
      throw Exception("Failed to fetch forecast weather data: $e");
    }
  }

  Future<void> fetchWeatherByLocation() async {
    resetState(); // Reset state
    isLoading = true;
    notifyListeners();

    try {
      Position position = await determinePosition();
      await getAddressFromLatLng(position);
      await getForecastWeatherData();
    } catch (e) {
      hasError = true;
      errorMessage = e.toString();
      log("Error fetching weather by location: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
