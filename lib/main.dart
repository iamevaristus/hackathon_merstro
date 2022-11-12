import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:merstro/lib.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MTheme.light(),
      darkTheme: MTheme.dark(),
      home: const MSplashScreen(),
    );
  }
}