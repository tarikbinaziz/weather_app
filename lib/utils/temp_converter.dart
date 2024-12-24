class TemperatureConverter {
  // Convert Celsius to Fahrenheit
  static double toFahrenheit(double celsius) {
    return celsius * 9 / 5 + 32;
  }

  // Convert Fahrenheit to Celsius
  static double toCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }
}
