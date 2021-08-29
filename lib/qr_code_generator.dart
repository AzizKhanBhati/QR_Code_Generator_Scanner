import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_scanner_generator/button.dart';

// ignore: must_be_immutable
class QRGenerator extends StatelessWidget {
  TextEditingController mycontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Generator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: mycontroller,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                  labelText: "Enter the data for generating a QR",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  prefixIcon: Icon(
                    Icons.link,
                  ),
                ),
                onEditingComplete: () {
                  MyButton(
                    widget: GeneratedQR(mycontroller.text),
                    name: "Generate QR",
                  );
                },
              ),
            ),
            SizedBox(height: 35),
            MyButton(
              widget: GeneratedQR(mycontroller.text),
              name: "Generate QR",
            ),
          ],
        ),
      ),
    );
  }
}

class GeneratedQR extends StatelessWidget {
  final myQR;
  const GeneratedQR(this.myQR);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generated QR "),
      ),
      body: Center(
        child: QrImage(
          data: myQR,
          version: QrVersions.auto,
          size: 250.0,
          gapless: false,
        ),
      ),
    );
  }
}
