import 'package:flutter/material.dart';

class BottomNavigatorContainer extends StatelessWidget {
  const BottomNavigatorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        height: 50,
        child: Center(
          child: Text(
            "Next",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
