import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double buttonMargin = 20;
const double menuPageButtonWidth = 200;
const double buttonWidth = 450;

///ページ遷移ボタンを作成するクラス
class PageTransitionButton extends ConsumerWidget {
  final String buttonName;
  final nextPageDelegate;

  const PageTransitionButton({
    required this.buttonName,
    required this.nextPageDelegate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: menuPageButtonWidth,
      margin: const EdgeInsets.all(buttonMargin),
      child: ElevatedButton(
        child: Text(buttonName),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => nextPageDelegate()));
        },
      ),
    );
  }
}

typedef OnScanCallback = void Function(String?);

///スキャン画面への遷移
///スキャン画面からスキャンデータを持って戻るボタン
class ScanButton extends StatelessWidget {
  final String buttonName;
  final nextPage;
  final OnScanCallback callback;

  const ScanButton({
    required this.buttonName,
    required this.nextPage,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      margin: const EdgeInsets.all(buttonMargin),
      child: ElevatedButton(
        child: Text(buttonName),
        onPressed: () async {
          String? result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => nextPage));

          callback(result);
        },
      ),
    );
  }
}
