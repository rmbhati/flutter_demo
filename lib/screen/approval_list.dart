import 'package:flutter/material.dart';

class ApprovalsList extends StatefulWidget {
  const ApprovalsList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  ApprovalsState createState() => ApprovalsState();
}

class ApprovalsState extends State<ApprovalsList> {
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
        body: const Text(
            "API calls and then load that data in to listview")); // Here you direct access using widget
  }
}
