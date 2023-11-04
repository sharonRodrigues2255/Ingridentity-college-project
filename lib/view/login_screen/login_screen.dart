import 'package:college_project/main.dart';
import 'package:college_project/view/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode fieldone = FocusNode();
    FocusNode fieldtwo = FocusNode();
    var mediaheight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Stack(
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
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 44),
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
                            child: TextFormField(
                              controller: _usernamecontroller,
                              keyboardType: TextInputType.emailAddress,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              focusNode: fieldone,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(fieldtwo);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'username',
                                  prefixIcon: Icon(Icons.person)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ('required');
                                } else {
                                  return (null);
                                }
                              },
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
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                            child: TextFormField(
                              controller: _passwordcontroller,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              focusNode: fieldtwo,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(fieldtwo);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'password',
                                  prefixIcon: Icon(Icons.key),
                                  suffixIcon:
                                      Icon(Icons.remove_red_eye_outlined)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ('required');
                                } else {
                                  return (null);
                                }
                              },
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 1),
                            child: Text(
                              'Dont have account?',
                              style: TextStyle(fontSize: mediawidth * .03),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                    child: InkWell(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          checkLogin(context);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
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
        ));
  }

  void checkLogin(BuildContext context) async {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;
    if (_username == _password) {
      final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RegistrationScreen()));
    } else {
      final _errorMessage = 'password and username does not match';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text(_errorMessage)));
    }
  }
}
