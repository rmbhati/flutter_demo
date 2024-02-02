import 'package:flutter/material.dart';
import 'package:flutter_demo/constant.dart';
import 'package:flutter_demo/model/approvals_model.dart';
import 'package:flutter_demo/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/home_model.dart';

class WidgetDemo extends StatefulWidget {
  const WidgetDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<WidgetDemo> {
  List<HomeItems> items = [];

  @override
  void initState() {
    super.initState();
    items.add(HomeItems(name: "TextView"));
    items.add(HomeItems(name: "Widgets"));
    items.add(HomeItems(name: "Menu 3"));
  }

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
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  //Constants.snackBar(context, items[index].name);
                },
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text("${items[index].name} (${items[index].name})",
                              style: const TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black54,
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0)),
                        ),
                      ])),
                ));
          }),
    );
  }
}
