import 'package:college_project/main.dart';
import 'package:college_project/view/bottom_navigation/bottom_navigation.dart';
import 'package:college_project/view/login_screen/login_screen.dart';
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
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * .60,
              child: Image(image: AssetImage('assets/images/logo.png'))),
        ),
      ),
    );
  }

// here  is the function for check the user is already loggedin or not
  Future<void> checkUserLoggedIn() async {
    final _SharedPref = await SharedPreferences.getInstance();
    final userLogged = _SharedPref.get(SAVE_KEY_NAME);
    if (userLogged == null || userLogged == false) {
      goToLogin();
    } else {
      splashWait();
    }
  }

  Future<void> goToLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void splashWait() {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
            (route) => false));
  }
}
