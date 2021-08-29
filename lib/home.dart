import 'package:flutter/material.dart';
import 'package:qrcode_scanner_generator/button.dart';
import 'package:qrcode_scanner_generator/qr_code_generator.dart';
import 'package:qrcode_scanner_generator/qr_code_scanner.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("QR CODE"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(name: "QR Scanner", widget: QRScanner()),
            MyButton(name: "Qr Generator", widget: QRGenerator())
          ],
        ),
      ),
    );
  }
}
