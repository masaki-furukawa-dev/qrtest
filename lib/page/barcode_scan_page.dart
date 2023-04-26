import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../item/scanner_error_widget.dart';

///バーコードスキャン画面を表示
class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({Key? key}) : super(key: key);
  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

///バーコードスキャン画面の状態
class _BarcodeScanPageState extends State<BarcodeScanPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: MobileScanner(
            controller: cameraController,
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
            fit: BoxFit.contain,
            onDetect: (barcode) {
              cameraController.dispose();
              Navigator.of(context).pop(barcode.barcodes.first.rawValue!);
            },
          ),
        ));
  }
}
