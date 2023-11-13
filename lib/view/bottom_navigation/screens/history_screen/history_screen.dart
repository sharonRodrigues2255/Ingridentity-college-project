import 'package:college_project/controller/history_controller.dart';
import 'package:college_project/view/bottom_navigation/bottom_navigation.dart';
import 'package:college_project/view/intro_screens/widgets/bottom_navigator_container.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan History"),
        ),
        body: HistoryController.historyList.isEmpty
            ? Center(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Start scanning products for their detailed analysis"),
                    GestureDetector(
                        onTap: () {
                          selectedIndex = 0;

                          setState(() {});
                        },
                        child: BottomNavigatorContainer(text: "Scan QR Codes"))
                  ],
                ),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: HistoryController.historyList.length,
                    itemBuilder: (context, index) {
                      final data = HistoryController.historyList[index];
                      return ListTile(
                        trailing: Text('${data.time.hour}-${data.time.minute}'),
                        title: Text(data.scanresult!),
                        subtitle: Text(
                            "${data.time.day}- ${data.time.month} ${data.time.year}"),
                      );
                    })));
  }
}
