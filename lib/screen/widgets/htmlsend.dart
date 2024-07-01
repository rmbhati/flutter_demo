import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HTMLSent extends StatefulWidget {
  const HTMLSent({super.key, required this.title});
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<HTMLSent> {
  WebViewController? _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..loadFlutterAsset("assets/index.html")
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  Widget buildWebView() {
    Timer(const Duration(seconds: 2), () {
      _webViewController!
          .runJavaScript('receiveMessageFromFlutter(${widget.title});');
    });
    return WebViewWidget(
      controller: _webViewController!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  size: orientation == Orientation.portrait
                      ? size.height * 0.025
                      : size.width * 0.02,
                  color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Mulish',
                    fontSize: orientation == Orientation.portrait
                        ? size.height * 0.023
                        : size.width * 0.018)),
            automaticallyImplyLeading: false,
            elevation: 10,
            shape: const Border(
                bottom: BorderSide(color: Colors.black, width: 0.1))),
        body: buildWebView());
  }
}
