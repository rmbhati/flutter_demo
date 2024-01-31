import 'package:flutter/material.dart';
import 'package:flutter_demo/constant.dart';
import 'package:flutter_demo/model/approvals_model.dart';
import 'package:flutter_demo/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetDemo extends StatefulWidget {
  const WidgetDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title,
              style: const TextStyle(fontFamily: 'Mulish', fontSize: 18.0)),
          elevation: 1,
          shape:
              const Border(bottom: BorderSide(color: Colors.black, width: 0.1)),
        ),
        body: Text("vcvxcv")); // Here you direct access using widget
  }
}
