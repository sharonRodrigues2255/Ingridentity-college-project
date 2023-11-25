import 'package:college_project/main.dart';
import 'package:college_project/view/bottom_navigation/screens/widgets/settings_tile_widget.dart';
import 'package:college_project/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SettingsTileWidget(
                icon: Icons.question_mark,
                text: "FAQs",
                onPress: () {},
              ),
              SettingsTileWidget(
                icon: Icons.share,
                text: "Share App",
                onPress: () {},
              ),
              SettingsTileWidget(
                icon: Icons.policy,
                text: "Provacy Policy",
                onPress: () {},
              ),
              SettingsTileWidget(
                icon: Icons.notes,
                text: "Terms of use",
                onPress: () {},
              ),
              SettingsTileWidget(
                icon: Icons.logout,
                text: "LogOut",
                onPress: () async {
                  final SharedPreferences obj =
                      await SharedPreferences.getInstance();

                  obj.setBool("isLogged", false);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                },
              )
            ],
          ),
        ));
  }

  logout(BuildContext context) async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route) => false);
    final _sharedPref = await SharedPreferences.getInstance();
    await _sharedPref.setBool(SAVE_KEY_NAME, false);
  }
}
