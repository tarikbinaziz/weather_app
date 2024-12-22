class AppConstants {
  const AppConstants._();

  // static const String baseUrl = 'http://128.199.225.75/api';
  static const String baseUrl = 'https://laundrymart.razinsoft.com/api';
  static const String loginUrl = '$baseUrl/login';
  static const String signUp = '$baseUrl/register';
  static const String logout = '$baseUrl/logout';
  static const String updateProfile = '$baseUrl/users/update';
  static const String services = '$baseUrl/services';
  static const String stores = '$baseUrl/shops';
  static const String variants = '$baseUrl/variants';
  static const String products = '$baseUrl/products';
  static const String promotions = '$baseUrl/promotions';

  static const String orderConditions = '$baseUrl/order-conditions';
  static const String address = '$baseUrl/addresses';
  static const String order = '$baseUrl/orders';

  static const String termsAndConditions =
      '$baseUrl/legal-pages/trams-of-service';
  static const String privacyPolicy = '$baseUrl/legal-pages/privacy-policy';
  static const String aboutUs = '$baseUrl/about-us';
  static const String ratings = '$baseUrl/shop/ratings';
  static const String applyCoupon = '$baseUrl/coupons';
  static const String reOrder = '$baseUrl/orders/reorder';
  static const String master = '$baseUrl/master';

  // Others
  static const double lat = 23.768496;
  static const double long = 90.356780;
  static const String appSettingsBox = 'appSettingsBox';
  static const String isDarkTheme = 'isDarkTheme';
  static const String authBox = 'authBox';
  static const String userBox = 'userBox';
  static const String locationBox = 'location_box';
  static const String authToken = 'authToken';
  static const String userData = 'userData';
  static const String cartBox = 'cartBox';
  static const String hasSeenSplashScreen = 'hasSeenSplashScreen';
  static const String appLocal = 'appLocal';
  static const String storeId = 'storeId';
}
