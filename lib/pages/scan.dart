import 'package:flutter/material.dart';

import '../widgets/QrCodeScanner.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.receipt_long,
              size: 100,
              color:Theme.of(context).primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              'Scannez votre reçu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Scannez votre reçu pour ajouter une transaction',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCodeScannerPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.grey[600],
              ),
              child: Text(
                'Scanner le code QR',
                style: TextStyle(fontSize: 16,color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
