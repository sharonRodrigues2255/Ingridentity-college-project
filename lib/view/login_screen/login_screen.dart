import 'package:college_project/controller/registration_controller.dart';
import 'package:college_project/main.dart';
import 'package:college_project/model/registration_model.dart';
import 'package:college_project/view/intro_screens/welcome_page.dart';
import 'package:college_project/view/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    registrationController.loadmydb();
    super.initState();
  }

  int index = 0;
  bool _isSecurePassword = true;
  RegistrationController registrationController = RegistrationController();
  final _formkey = GlobalKey<FormState>();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mydb = Hive.box("localdb");
    FocusNode fieldone = FocusNode();
    FocusNode fieldtwo = FocusNode();
    // var mediaheight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 4,
                  child: Container(
                    height: 65,
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
                            hintText: 'username or email',
                            prefixIcon: Icon(Icons.person)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ('required');
                          } else if (!mydb.keys.contains(value)) {
                            return ("UserName is not registered");
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
                        controller: _passwordcontroller,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        focusNode: fieldtwo,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: togglePassword()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ('required');
                          } else {
                            return (null);
                          }
                        },
                        obscureText: _isSecurePassword,
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
                                builder: (context) => RegistrationScreen()));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 1),
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
                      checkLogin(context, 0);
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
        ));
  }

  void checkLogin(BuildContext context, index) async {
    var mydb = Hive.box('localdb');
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;
    if (mydb.get(_username)!.password == _password) {
      final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => WelcomePage()));
    } else {
      final _errorMessage = 'password and username does not matchhhhh';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text(_errorMessage)));
    }
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
}
