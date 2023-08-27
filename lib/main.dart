import 'package:flutter/material.dart';

void main() {
  runApp(const TimeLuxeApp());
}

class TimeLuxeApp extends StatelessWidget {
  const TimeLuxeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
