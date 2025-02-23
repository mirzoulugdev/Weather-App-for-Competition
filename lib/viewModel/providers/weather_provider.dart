import 'dart:developer';
import 'package:Weather/model/forecast_model.dart';
import 'package:Weather/viewModel/data/repositories/repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider extends ChangeNotifier {
  final RepositoryImpl repo;

  WeatherProvider({required this.repo});

  bool isLoading = false;

  String errorMessage = "";
  String address = "Unknown";

  ForecastModel? forecastWeather;

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

  Future<void> getForecastWeatherData() async {
    try {
      // log("Fetching forecast for: $address");

      final result = await repo.fetchForecastData(address);
      if (result != null) {
        forecastWeather = result;
        log(forecastWeather.toString());
      } else {
        throw Exception("No forecast data found.");
      }
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to fetch forecast weather data: $e");
    }
  }

  Future<void> fetchWeatherByLocation() async {
    isLoading = true;
    notifyListeners();

    try {
      Position position = await determinePosition();
      await getAddressFromLatLng(position);
      await getForecastWeatherData();
    } catch (e) {
      errorMessage = e.toString();
      log("Error fetching weather by location: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
