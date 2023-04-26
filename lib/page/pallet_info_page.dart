import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../item/button.dart';
import 'barcode_scan_page.dart';

/// メッセージ・パレット情報カード表示部分のmargin
const double messageMargin = 20;

class PalletInfoPage extends ConsumerWidget {
  const PalletInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("HOME")),
      body: Stack(
        children: [
          ScanButton(
            buttonName: "scan",
            nextPage: const BarcodeScanPage(),
            callback: (String? result) async {
              if (result != null) {}
            },
          ),
        ],
      ),
    );
  }
}
