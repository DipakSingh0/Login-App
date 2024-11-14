import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/src/utils/theme/theme.dart';
import 'src/features/authentication/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 500),
      home:  SplashScreen(),
      // home: Dashboard()
    );
  }
}
