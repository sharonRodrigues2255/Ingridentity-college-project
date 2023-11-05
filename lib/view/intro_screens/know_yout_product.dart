import 'package:college_project/view/intro_screens/widgets/bottom_navigator_container.dart';
import 'package:college_project/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

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
                      width: mediawidth * .85,
                      image: AssetImage('assets/images/intro_image2.png')),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 3.5,
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    height: 7,
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: mediaHeight * .13,
              ),
              Text(
                "Know your product",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Scan food or cosmetic products\nand get their analysis",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.of(context)
                .push((MaterialPageRoute(builder: (context) => LoginScreen())));
          },
          child: BottomNavigatorContainer(
            text: "Next",
          )),
    );
  }
}
