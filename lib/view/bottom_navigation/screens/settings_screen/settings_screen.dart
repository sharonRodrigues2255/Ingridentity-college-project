import 'package:college_project/view/bottom_navigation/screens/widgets/settings_tile_widget.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SettingsTileWidget(
                icon: Icons.question_mark,
                text: "FAQs",
              ),
              SettingsTileWidget(icon: Icons.share, text: "Share App"),
              SettingsTileWidget(icon: Icons.policy, text: "Provacy Policy"),
              SettingsTileWidget(icon: Icons.notes, text: "Terms of use"),
              SettingsTileWidget(icon: Icons.logout, text: "LogOut")
            ],
          ),
        ));
  }
}
