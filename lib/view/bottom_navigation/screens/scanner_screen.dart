import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    MobileScannerController scannerController = MobileScannerController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                scannerController.toggleTorch();
                flashStatus = true;
                setState(() {});
              },
              icon: flashStatus == false
                  ? Icon(Icons.flash_on)
                  : Icon(Icons.flash_off)),
          IconButton(
              onPressed: () {
                scannerController.switchCamera();
                backCameraOn = false;
                setState(() {});
              },
              icon: backCameraOn == true
                  ? Icon(Icons.camera_front)
                  : Icon(Icons.photo_camera_back))
        ],
      ),
      body: Center(
        child: MobileScanner(
            controller: scannerController,
            onDetect: (capturedCode) {
              final code = capturedCode;
            }),
      ),
    );
  }
}

bool flashStatus = false;
bool backCameraOn = true;
