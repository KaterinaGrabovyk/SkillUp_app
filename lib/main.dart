import 'package:flutter/material.dart';
import 'package:sequest_app/screens/main_screen.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 60, 177, 17),
        ),
      ),
      home: MainScreen(),
    );
  }
}
