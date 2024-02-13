import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/constant.dart';
import 'package:flutter_demo/model/approvals_model.dart';
import 'package:flutter_demo/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/home_model.dart';

class TextEditDemo extends StatefulWidget {
  const TextEditDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<TextEditDemo> {
  //RichText
  //text
  //TextField
  //TextFormField
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(fontFamily: 'Mulish', fontSize: 18.0)),
        elevation: 1,
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 0.1)),
      ),
      body: DefaultTextStyle.merge(
        style:  TextStyle(
          fontSize: size.width*0.09,
          fontWeight: FontWeight.bold,
        ),
        child: const Text('DefaultTextStyle'),
      ),
    );
  }
}
