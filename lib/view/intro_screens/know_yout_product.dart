import 'package:college_project/main.dart';
import 'package:college_project/view/allergy_screen/food_allergy.dart';
import 'package:college_project/view/intro_screens/widgets/bottom_navigator_container.dart';
import 'package:college_project/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KnowYourProduct extends StatelessWidget {
  const KnowYourProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: mediawidth * .3),
                child: Container(
                  child: Image(
                      width: mediaHeight * .35,
                      image: AssetImage('assets/images/intro_image2.png')),
                ),
              ),
              Spacer(),
              Text(
                "Know your product",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Scan food or cosmetic products\nand get their analysis",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.of(context)
                .push((MaterialPageRoute(builder: (context) => FoodAllergy())));
          },
          child: BottomNavigatorContainer(
            text: "Next",
          )),
    );
  }
}
