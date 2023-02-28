import 'dart:developer';
import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:uangin/classes/color_scheme.dart';


class QrisPage extends StatefulWidget {
  const QrisPage({Key? key, required this.user}) : super(key: key);
  final AsyncSnapshot<User?> user;

  @override
  State<StatefulWidget> createState() => _QrisPageState();
}

class _QrisPageState extends State<QrisPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    // if (Platform.isAndroid) {
    //   controller!.pauseCamera();
    // }
    // controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      foregroundColor: const Color(0xff5ADFB2),
                      disabledForegroundColor:const Color(0xff5ADFB2),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 22,
                      color: Color(0xff5ADFB2),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'QRIS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: UsedColor.primaryGrey,
                          fontFamily: "OpenSans"
                        ),
                      ),
                    ],
                  ),
                  )
                  
                
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Center(
              child: Text("Scan disini untuk bayar", style: TextStyle(fontFamily: "OpenSans", fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xff8D8D8D)))
            ),
            const SizedBox(height: 10,),
            Expanded(flex: 7, child: _buildQrView(context)),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (result != null)
                      Text(
                          'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                    else
                      // const Text('Scan a code'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/Icon/qrisIcon2.png", width: 2, height: 2,),
                        // Container(
                        //   margin: const EdgeInsets.all(8),
                        //   child: ElevatedButton(
                        //       onPressed: () async {
                        //         await controller?.toggleFlash();
                        //         setState(() {});
                        //       },
                        //       child: FutureBuilder(
                        //         future: controller?.getFlashStatus(),
                        //         builder: (context, snapshot) {
                        //           return Text('Flash: ${snapshot.data}');
                        //         },
                        //       )),
                        // ),
                        // Container(
                        //   margin: const EdgeInsets.all(8),
                        //   child: ElevatedButton(
                        //       onPressed: () async {
                        //         await controller?.flipCamera();
                        //         setState(() {});
                        //       },
                        //       child: FutureBuilder(
                        //         future: controller?.getCameraInfo(),
                        //         builder: (context, snapshot) {
                        //           if (snapshot.data != null) {
                        //             return Text(
                        //                 'Camera facing ${describeEnum(snapshot.data!)}');
                        //           } else {
                        //             return const Text('loading');
                        //           }
                        //         },
                        //       )),
                        // )
                      
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    //     Container(
                    //       margin: const EdgeInsets.all(8),
                    //       child: ElevatedButton(
                    //         onPressed: () async {
                    //           await controller?.pauseCamera();
                    //         },
                    //         child: const Text('pause',
                    //             style: TextStyle(fontSize: 20)),
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: const EdgeInsets.all(8),
                    //       child: ElevatedButton(
                    //         onPressed: () async {
                    //           await controller?.resumeCamera();
                    //         },
                    //         child: const Text('resume',
                    //             style: TextStyle(fontSize: 20)),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      // overlayMargin: EdgeInsets.all(20),
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color(0xffB1B1B1),
          borderRadius: 5,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 350),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}