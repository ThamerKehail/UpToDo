import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTestScreen extends StatefulWidget {
  const WebViewTestScreen({Key? key}) : super(key: key);

  @override
  State<WebViewTestScreen> createState() => _WebViewTestScreenState();
}

class _WebViewTestScreenState extends State<WebViewTestScreen> {
  late WebViewController controller;
  void loadLocalHtml() async {
    final html =
        await rootBundle.loadString('assets/TradingView/Chart_lib/index.html');

    final url = Uri.dataFromString(
      html,
      // parameters: {
      //   'symbol': 'AUD/USD',
      //   'timezone': 'Asia/Ashkhabad',
      //   'theme': 'light',
      //   'lang': 'en',
      // },
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();

    controller.loadUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.disabled,
        onWebViewCreated: (controller) {
          this.controller = controller;
          loadLocalHtml();
        },
      ),
    );
  }
}
