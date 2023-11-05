import 'package:college_project/view/intro_screens/widgets/bottom_navigator_container.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan History"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  child: Icon(
                    Icons.history,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 6,
                    child: Text("!",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 103, 18, 207))))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Empty history",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Start scanning products for their detailed analysis"),
            BottomNavigatorContainer(text: "Scan QR Codes")
          ],
        ),
      ),
    );
  }
}
