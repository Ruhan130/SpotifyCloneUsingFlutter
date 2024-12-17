import 'package:flutter/material.dart';
import 'package:project/core/config/theme/app_theme.dart';
import 'package:project/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: Apptheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
