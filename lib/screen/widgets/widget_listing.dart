import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/constant.dart';
import 'package:flutter_demo/screen/widgets/text_edit.dart';

import '../../model/home_model.dart';
import '../../utils/strings.dart';
import 'buttons.dart';
import 'image_view.dart';

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
    items.add(HomeItems(name: Strings.wIconBtn));
    items.add(HomeItems(name: Strings.wImageView));
    items.add(HomeItems(name: "Coming soon..."));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: size.height * 0.05,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              size: size.height * 0.03, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.title,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Mulish',
                fontSize: size.height * 0.023)),
        elevation: 10,
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 0.1)),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  itemClick(context, items[index].name, size);
                },
                child: Card(
                  margin: EdgeInsets.all(size.width * 0.015),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: Text(items[index].name ,
                        style:  TextStyle(
                            letterSpacing: 1,
                            color: Colors.black54,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.02)),
                  ),
                ));
          }),
    );
  }
}

void itemClick(BuildContext context, String name, Size size) {
  if (name == Strings.wTextEdit) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => TextEditDemo(title: name)));
  }else if (name == Strings.wIconBtn) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ButtonsDemo(title: name)));
  }else if (name == Strings.wImageView) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ImageViewDemo(title: name)));
  } else {
    Constants.snackBar(context, name, size);
  }
}
