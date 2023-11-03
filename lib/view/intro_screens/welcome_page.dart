import 'package:college_project/utils/text_constants.dart';
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
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/intro_image1.png'))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    height: 7,
                    width: 12,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  CircleAvatar(
                    radius: 3.5,
                    backgroundColor: Colors.blue,
                  )
                ],
              ),
              SizedBox(
                height: mediaHeight * .11,
              ),
              Text(
                "Wecome to ${ConstantTexts.appName}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Find products that align with your dietry and\nhealth needs",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          height: 50,
          child: Center(
            child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
