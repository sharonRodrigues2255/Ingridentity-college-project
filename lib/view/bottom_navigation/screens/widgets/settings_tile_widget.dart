import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPress});
  final IconData icon;
  final String text;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPress,
        child: Card(
          child: Container(
            height: 50,
            child: Row(
              children: [
                Icon(icon),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Icon(Icons.chevron_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
