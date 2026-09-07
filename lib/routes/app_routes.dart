/// AppRoutes - Central navigation configuration
///
/// WHY: Instead of using Navigator.push(context, ...) everywhere,
/// we use named routes. This makes navigation:
/// - Consistent
/// - Easy to change
/// - Supports GetX navigation
class AppRoutes {
  AppRoutes._();
  // Route Names
  // WHY: Constants prevent typos in route names

  static const String tracking = '/tracking';
 // Auth Routes
  static const String login = '/login';
  static const String register = '/register';
  
  // Main App Routes
  static const String home = '/home';
  static const String settings = '/settings';
  static const String profile = '/profile';
  static const String notifications = '/notifications';
  
  // Food Routes
  static const String foodDetail = '/food-detail';
  static const String addFood = '/add-food';
  
  // Route Parameters
  // WHY: When passing data between screens, we use parameters
  static const String paramFoodId = 'foodId';
  static const String paramDate = 'date';

  // Build URL for food detail with ID
  static String foodDetailRoute(String foodId) {
    return '$foodDetail?$paramFoodId=$foodId';
  }

  // Build URL for tracking with date
  static String trackingRoute(DateTime date) {
    final dateString = date.toIso8601String().split('T').first;
    return '$tracking?$paramDate=$dateString';
  }
}
