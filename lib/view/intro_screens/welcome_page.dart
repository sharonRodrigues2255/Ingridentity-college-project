import 'package:college_project/utils/text_constants.dart';
import 'package:college_project/view/intro_screens/know_yout_product.dart';
import 'package:college_project/view/intro_screens/widgets/bottom_navigator_container.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: mediawidth * .3),
                  child: Container(
                    height: mediaHeight * .35,
                    width: mediawidth * .36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/images/intro_image1.png'))),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Wecome to ${ConstantTexts.appName}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Find products that align with your dietry and\nhealth needs",
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
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => KnowYourProduct()));
          },
          child: BottomNavigatorContainer(
            text: "Next",
          )),
    );
  }
}
