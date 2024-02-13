import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/constant.dart';
import 'package:flutter_demo/model/approvals_model.dart';
import 'package:flutter_demo/screen/widgets/text_edit.dart';
import 'package:flutter_demo/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/home_model.dart';
import '../../utils/strings.dart';

class WidgetListing extends StatefulWidget {
  const WidgetListing({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<WidgetListing> {
  List<HomeItems> items = [];

  @override
  void initState() {
    super.initState();
    items.add(HomeItems(name: Strings.wTextEdit));
    items.add(HomeItems(name: "Button/ImageBtn/ImageView"));
    items.add(HomeItems(name: "Coming soon..."));
  }

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
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  itemClick(context, items[index].name,size);
                },
                child: Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(children: <Widget>[
                        Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.all(5),
                          child: Text(items[index].name,
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

void itemClick(BuildContext context, String name, Size size) {
  if (name == Strings.wTextEdit) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => TextEditDemo(title: name)));
  } else {
    Constants.snackBar(context, name, size);
  }
}
