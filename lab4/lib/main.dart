import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/calendar_screen.dart';
import 'screens/map_screen.dart'; // Додај ја новата рута
import 'providers/event_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const CalendarScreen(),
          '/map': (context) => const MapScreen(),
        },
      ),
    );
  }
}
