import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  var qrData = "No data found";

  var data;

  var hasData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Raw Data:  ${(qrData)}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.launch_outlined),
                  onPressed: hasData
                      ? () async {
                          if (await canLaunch(qrData)) {
                            print(qrData);
                            await launch(qrData);
                          } else {
                            throw 'Could not launch ';
                          }
                        }
                      : null,
                ),
              ],
            ),
            SizedBox(height: 35),
            Container(
              width: ((MediaQuery.of(context).size.width) / 2) - 45,
              height: 35,
              child: MaterialButton(
                color: Colors.grey[200],
                shape: StadiumBorder(),
                child: Text(
                  "Scan QR",
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () async {
                  var options = ScanOptions(
                    autoEnableFlash: true,
                  );
                  var data = await BarcodeScanner.scan(options: options);
                  setState(() {
                    qrData = data.rawContent.toString();
                    hasData = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
