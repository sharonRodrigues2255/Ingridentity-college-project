import 'package:college_project/main.dart';
import 'package:college_project/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FocusNode fieldone = FocusNode();
  FocusNode fieldtwo = FocusNode();
  FocusNode fieldthree = FocusNode();
  @override
  Widget build(BuildContext context) {
    var mediaheight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.lightGreen),
                child: Image.asset(
                  'assets/images/shopping.png',
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                bottom: 480,
                width: mediawidth * 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 44),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 4,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            focusNode: fieldone,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(fieldtwo);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email or Mobile number'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //     bottom: 450,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 180),
              //       child: Container(child: Text('OR')),
              //     )),
              Positioned(
                bottom: 350,
                width: 395,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 4,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          focusNode: fieldtwo,
                          onSubmitted: (value) {
                            FocusScope.of(context).requestFocus(fieldthree);
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'password'),
                          obscureText: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 350,
                width: 395,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 4,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          focusNode: fieldthree,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ' confirm password'),
                          obscureText: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        logout(context);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginScreen()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                        child: Text(
                          'Already have account',
                          style: TextStyle(fontSize: mediawidth * .03),
                        ),
                      )),
                ],
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  child: Center(
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 480,
            left: 130,
            child: CircleAvatar(
              radius: mediaheight * .07,
              child: Icon(
                Icons.person,
                size: mediaheight * .1,
              ),
            ),
          )
        ],
      ),
    );
  }

  logout(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route) => false);
    final _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setBool(SAVE_KEY_NAME, false);
  }
}
