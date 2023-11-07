import 'package:college_project/view/allergy_screen/food_allergy.dart';
import 'package:college_project/view/bottom_navigation/screens/scanner_screen/screens/scan_result.dart';
import 'package:college_project/view/intro_screens/know_yout_product.dart';
import 'package:college_project/view/intro_screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rive/rive.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
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
                        checkQrCode(qrCode.barcodes, context);
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
      if (allergicItemsList
          .map((e) => e.toLowerCase())
          .contains(code?.rawValue?.toLowerCase())) {
        if (!isScanCompleted) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ScanResult(
                    result: true,
                  )));
          isScanCompleted = true;
          setState(() {});
        }
      } else {
        if (!isScanCompleted) {
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
