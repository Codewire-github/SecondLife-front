import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/common/widgets/customButtons.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  String scannedResults = "";
  void startScan() async {
    var result = '';
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          '#FFFFFF', 'Cancel', true, ScanMode.QR);
    } on PlatformException catch (e) {
      result = "Failed to get platform version.";
      Get.snackbar("Error occured", e.code);
    } catch (e) {
      Get.snackbar("Error occured", e.toString());
    }
    if (!mounted) return;

    setState(() {
      scannedResults = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: CustomLargeButton(
                  label: "Scan QR code",
                  onPressed: () {
                    startScan();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
