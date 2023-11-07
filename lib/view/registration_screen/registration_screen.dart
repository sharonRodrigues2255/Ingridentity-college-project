import 'package:college_project/controller/registration_controller.dart';

import 'package:college_project/model/registration_model.dart';
import 'package:college_project/view/intro_screens/welcome_page.dart';
import 'package:college_project/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    registrationController.loadmydb() ?? [];
    super.initState();
  }

  bool _isSecurePassword = true;
  bool _isSecureConfirmPassword = true;
  RegistrationController registrationController = RegistrationController();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode fieldone = FocusNode();
  FocusNode fieldtwo = FocusNode();
  FocusNode fieldthree = FocusNode();
  @override
  Widget build(BuildContext context) {
    var mydb = Hive.box('localdb');
    final formkey = GlobalKey<FormState>();
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  "Registration",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
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
                      child: TextFormField(
                        controller: usernamecontroller,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        focusNode: fieldtwo,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(fieldthree);
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'username',
                            prefixIcon: Icon(Icons.person)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ('required');
                          }
                          if (mydb.keys.contains(value)) {
                            return "username is already taken";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
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
                      child: TextFormField(
                        controller: passwordcontroller,
                        focusNode: fieldthree,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: togglePassword()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ('required');
                          } else {
                            return null;
                          }
                        },
                        obscureText: _isSecurePassword,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
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
                      child: TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'confirm password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: toggleConfirmPassword()),
                        validator: (value) {
                          if (value != passwordcontroller.text) {
                            return ('Passwords doesnt match');
                          } else {
                            return null;
                          }
                        },
                        obscureText: _isSecureConfirmPassword,
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
                                builder: (context) => LoginScreen()));
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
                child: InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      registrationController.SaveUserData(UserRegModel(
                          username: usernamecontroller.text,
                          password: passwordcontroller.text));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    height: 50,
                    child: Center(
                      child: Text(
                        "SignUp",
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
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
  }

  Widget toggleConfirmPassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecureConfirmPassword = !_isSecureConfirmPassword;
          });
        },
        icon: _isSecureConfirmPassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
  }
}
