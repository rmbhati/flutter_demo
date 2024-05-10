import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../utils/constant.dart';

class HTMLView extends StatefulWidget {
  const HTMLView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<HTMLView> {
  late InAppWebViewController _webViewController;

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
        body: InAppWebView(
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
            var uri = "assets/index.html";
            controller.loadFile(assetFilePath: uri);
            _webViewController.addJavaScriptHandler(
                handlerName: 'handlerFoo',
                callback: (args) {
                  return {
                    'style': widget.title
                    //'style': '101413'
                  };
                });
          },
        ));
  }
}
