import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes_management.dart';
import 'utils/app_strings.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteManagement.initialRoute,
      routes: RouteManagement.routes,
      onGenerateRoute: RouteManagement.generateRoute,
    );
  }
}
