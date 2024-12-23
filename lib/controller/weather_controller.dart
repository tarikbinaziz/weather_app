import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

// make a provider to store weather data
final weatherProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  final weatherFactory = WeatherFactory(
      "9fd291a7232c8941fa28f107f03a2264"); // Replace with your API key
  return WeatherNotifier(weatherFactory);
});

class WeatherState {
  final Weather? currentWeather;
  final List<Weather> forecast;
  final bool isLoading;
  final String errorMessage;

  WeatherState({
    this.currentWeather,
    this.forecast = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  WeatherState copyWith({
    Weather? currentWeather,
    List<Weather>? forecast,
    bool? isLoading,
    String? errorMessage,
  }) {
    return WeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      forecast: forecast ?? this.forecast,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Create a StateNotifier to manage weather data
class WeatherNotifier extends StateNotifier<WeatherState> {
  final WeatherFactory _weatherFactory;

  WeatherNotifier(this._weatherFactory) : super(WeatherState(isLoading: true));

  Future<void> fetchWeatherData() async {
    try {
      // Fetch current location
      Position position = await _getUserLocation();

      // Fetch current weather
      Weather currentWeather = await _weatherFactory.currentWeatherByLocation(
          position.latitude, position.longitude);

      // Fetch the forecast for the next 3 days
      List<Weather> forecast = await _weatherFactory.fiveDayForecastByLocation(
          position.latitude, position.longitude);

      state = state.copyWith(
        currentWeather: currentWeather,
        forecast:
            forecast.take(3).toList(), // Taking the next 3 days of forecast
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error fetching weather data: $e',
      );
    }
  }

  Future<Position> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
