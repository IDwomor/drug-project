import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../widgets/custom_button.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = "Scanned data will appear here";
  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          'aff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrResult = qrCode.toString();
      });
    } on PlatformException {
      qrResult = "Failed to read QR Code";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              '$qrResult',
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 30),
            CustomButton(onPressed: scanQR, text: "Scan QR Code"),
          ],
        ),
      ),
    );
  }
}
