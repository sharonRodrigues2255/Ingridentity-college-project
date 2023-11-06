import 'package:college_project/main.dart';
import 'package:college_project/view/intro_screens/welcome_page.dart';
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
    // Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context)
    //     .pushReplacement(
    //         MaterialPageRoute(builder: (context) => const WelcomePage())));
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image(image: AssetImage('assets/images/logo.png')),
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
            MaterialPageRoute(builder: (context) => WelcomePage()),
            (route) => false));
  }
}
