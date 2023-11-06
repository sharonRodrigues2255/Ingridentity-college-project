import 'package:college_project/view/bottom_navigation/bottom_navigation.dart';
import 'package:college_project/view/intro_screens/widgets/bottom_navigator_container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({super.key, required this.result});

  final bool result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: result
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Lottie.asset("assets/lottie/lottie2.json",
                          width: 150, height: 150),
                    ),
                    Text(
                      "Food item is Harmfull for you",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavigationScreen()));
                        },
                        child: BottomNavigatorContainer(text: "Scan again"))
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Lottie.asset("assets/lottie/lottie1.json",
                          width: 150, height: 150),
                    ),
                    Text(
                      "Food item is Healthy for you",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavigationScreen()));
                        },
                        child: BottomNavigatorContainer(text: "Scan again"))
                  ],
                ),
              ));
  }
}
