import 'package:college_project/main.dart';
import 'package:college_project/view/bottom_navigation/bottom_navigation.dart';
import 'package:college_project/view/login_screen/login_screen.dart';
import 'package:college_project/view/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final islogged = await prefs.getBool("isLogged");
      print(islogged);

      if (islogged == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigationScreen(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationScreen(),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
              width: 200,
              child: Image(image: AssetImage('assets/images/logo.png'))),
        ),
      ),
    );
  }

  Future<void> goToLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<void> checkUserLoggedIn() async {
    final _SharedPref = await SharedPreferences.getInstance();
    final userLogged = _SharedPref.get(SAVE_KEY_NAME);
    if (userLogged == null || userLogged == false) {
      goToLogin();
    } else {
      splashWait();
    }
  }

  void splashWait() {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
            (route) => false));
  }
}
