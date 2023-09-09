import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pamride/helpers/ColorsRes.dart';
import 'package:pamride/helpers/GrobagColor.dart';
import 'package:pamride/helpers/Language_Constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  bool isScanning = true;
  String scannedCode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  bool isValidCode(String code) {
    // Add your code validation logic here
    return code.isNotEmpty;
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      // Handle the scanned data (QR code content)
      var data = scanData.code;
      print('\n Scanned Data: $scanData');
      print('code : ${data}');
      print('\n');

      setState(() {
        scannedCode = data!;
      });

      if (isValidCode(data!)) {
        setState(() {
          isScanning = false;
        });
        controller.stopCamera();
      }
    });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      print(result!.code);
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    readQr();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          translation(context).scan,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: white,
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                if (!isScanning)
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Scanned Code: $scannedCode',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 3,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: isScanning
                        ? QrScannerOverlayShape(
                            borderColor: ColorsRes.secondaryColor,
                            borderRadius: 10,
                            borderLength: 30,
                            borderWidth: 10,
                            cutOutSize: 250,
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
