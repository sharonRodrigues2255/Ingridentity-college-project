
import 'package:college_project/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

const SAVE_KEY_NAME = 'userLOggedin';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());

  }
}
