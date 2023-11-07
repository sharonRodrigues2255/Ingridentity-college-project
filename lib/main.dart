import 'package:college_project/model/registration_model.dart';
import 'package:college_project/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const SAVE_KEY_NAME = 'userLOggedin';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserRegModelAdapter());
  var box = await Hive.openBox('localdb');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
