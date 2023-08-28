import 'package:flutter/material.dart';
import 'package:time_luxe/splach_screen/splach_screen.dart';

void main() {
  runApp(const TimeLuxeApp());
}

class TimeLuxeApp extends StatelessWidget {
  const TimeLuxeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
    );
  }
}
