
import 'package:flutter/material.dart';
import 'package:updated_drug_app/content_pages/qr_code/fetch.dart';
import 'package:updated_drug_app/content_pages/qr_code/generate_qr_code.dart';
import 'package:updated_drug_app/content_pages/qr_code/qr-scanner.dart';
import 'package:updated_drug_app/content_pages/qr_code/scan_qr_code.dart';

import '../../widgets/custom_button.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffd7d7d7),
      appBar: AppBar(
        backgroundColor: const Color(0xff691d2b),
        title: const Text('QR Code'),
        titleTextStyle: const TextStyle(
          color: Color(0xffd7d7d7),
          fontSize: 20,
          fontFamily: 'FiraSans',
          fontWeight: FontWeight.bold,
          letterSpacing: 5,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRScanner()),
                  );
                },
                text: "Scan QR Code"),
            const SizedBox(height: 10),
            CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GenerateQRCode()),
                  );
                },
                text: "Generate Code"),
            const SizedBox(height: 10),
           /* CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FetchData()),
                  );
                },
                text: "Fetch Code"),*/
          ],
        ),
      ),
    );
  }
}

