import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/config/app_constants.dart';

// make a provider to store weather data
final weatherProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  final weatherFactory = WeatherFactory(
     AppConstants.weatherFactoryKey ); // Replace with your API key
  return WeatherNotifier(weatherFactory, ref: ref);
});

class WeatherState {
  final Weather? currentWeather;
  final List<List<Weather>> groupedForecast;

  final bool isLoading;
  final String errorMessage;

  WeatherState({
    this.currentWeather,
    this.groupedForecast = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  WeatherState copyWith({
    Weather? currentWeather,
    List<List<Weather>>? groupedForecast,
    bool? isLoading,
    String? errorMessage,
  }) {
    return WeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      groupedForecast: groupedForecast ?? this.groupedForecast,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Create a StateNotifier to manage weather data
class WeatherNotifier extends StateNotifier<WeatherState> {
  final Ref ref;
  final WeatherFactory _weatherFactory;

  WeatherNotifier(this._weatherFactory, {required this.ref})
      : super(WeatherState(isLoading: true)) {
    fetchWeatherData();
  }

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

      // Group forecast by day
      List<List<Weather>> groupedForecast = _groupForecastByDay(forecast);

      state = state.copyWith(
        currentWeather: currentWeather,
        groupedForecast: groupedForecast
            .take(3)
            .toList(), // Taking the next 3 days of forecast
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error fetching weather data: $e',
      );
    }
  }

  // Helper method to group forecast by day
  List<List<Weather>> _groupForecastByDay(List<Weather> forecast) {
    List<List<Weather>> groupedForecast = [];
    DateTime? currentDay;

    List<Weather> dailyForecast = [];
    for (var weather in forecast) {
      if (currentDay == null || _isSameDay(weather.date, currentDay)) {
        dailyForecast.add(weather);
      } else {
        groupedForecast.add(dailyForecast);
        dailyForecast = [weather];
      }
      currentDay = weather.date;
    }

    // Add the last day
    if (dailyForecast.isNotEmpty) {
      groupedForecast.add(dailyForecast);
    }

    return groupedForecast;
  }

// Helper method to check if two dates are the same day
  bool _isSameDay(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) return false;
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
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

class UVIndexState {
  final double uvIndex;
  final bool isLoading;
  final String errorMessage;

  UVIndexState({
    this.uvIndex = 0.0,
    this.isLoading = false,
    this.errorMessage = '',
  });

  UVIndexState copyWith({
    double? uvIndex,
    bool? isLoading,
    String? errorMessage,
  }) {
    return UVIndexState(
      uvIndex: uvIndex ?? this.uvIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
