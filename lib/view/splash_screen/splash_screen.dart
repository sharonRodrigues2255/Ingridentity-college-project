import 'package:college_project/view/intro_screens/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (context) => const WelcomePage())));
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
}
