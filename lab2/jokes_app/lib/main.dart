import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      debugShowCheckedModeBanner: false, // Disable debug banner for cleaner UI
      theme: _buildThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/random': (context) => RandomJokeScreen(),
      },
    );
  }

  // Custom theme for a consistent look and feel
  ThemeData _buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true, // Enables Material Design 3
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
