import 'package:college_project/model/history_model.dart';
import 'package:college_project/view/intro_screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const SAVE_KEY_NAME = 'userLOggedin';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryModelAdapter());
  var box = await Hive.openBox<HistoryModel>('HISTORY');
  var box1 = await Hive.openBox("ALERGIES");
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
        home: WelcomePage());
  }
}
