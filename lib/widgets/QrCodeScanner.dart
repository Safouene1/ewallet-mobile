import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeScannerPage extends StatelessWidget {
  final MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: cameraController, onDetect: (BarcodeCapture barcodes) {  },


          ),
          Positioned(
            bottom: 20,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}