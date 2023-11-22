import 'package:college_project/controller/alergy_controller.dart';
import 'package:college_project/controller/history_controller.dart';
import 'package:college_project/model/history_model.dart';
import 'package:college_project/view/bottom_navigation/screens/scanner_screen/screens/scan_result.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rive/rive.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  var controller = AlergyController();
  @override
  Widget build(BuildContext context) {
    bool detected = false;
    isScanCompleted = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width - 200),
              child: Text(
                "Place the QR code here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: MediaQuery.of(context).size.width - 80,
                  child: MobileScanner(
                      controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.normal),
                      onDetect: (qrCode) {
                        if (detected == false) {
                          checkQrCode(qrCode.barcodes, context);
                          detected = true;
                          setState(() {});
                        }
                      }),
                ),
                Container(
                    height: MediaQuery.of(context).size.width - 80,
                    width: MediaQuery.of(context).size.width - 80,
                    child: RiveAnimation.asset(
                      'assets/rive_animations/scan_animation.riv',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  checkQrCode(List<Barcode> codes, BuildContext context) {
    for (Barcode? code in codes) {
      if (controller.alergydb.values
          .map((e) => e.toLowerCase())
          .contains(code?.rawValue?.toLowerCase())) {
        if (!isScanCompleted) {
          HistoryController.addToHistory(HistoryModel(
              id: DateTime.now().millisecond,
              scanresult: code?.rawValue,
              time: DateTime.now(),
              isPositive: true));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ScanResult(
                    result: true,
                  )));
          isScanCompleted = true;
          setState(() {});
        }
      } else {
        if (!isScanCompleted) {
          HistoryController.addToHistory(HistoryModel(
              id: DateTime.now().millisecond,
              scanresult: code?.rawValue,
              time: DateTime.now(),
              isPositive: false));
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ScanResult(
                    result: false,
                  )));
          isScanCompleted = true;
          setState(() {});
        }
      }
    }
  }
}

bool isScanCompleted = false;
