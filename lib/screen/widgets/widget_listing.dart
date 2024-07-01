import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/widgets/buttons.dart';
import 'package:flutter_demo/screen/widgets/dropdowns.dart';
import 'package:flutter_demo/screen/widgets/image_view.dart';
import 'package:flutter_demo/screen/widgets/selections.dart';
import 'package:flutter_demo/screen/widgets/text_edit.dart';
import 'package:flutter_demo/utils/strings.dart';
import '../../model/home_model.dart';

class WidgetListing extends StatefulWidget {
  const WidgetListing({super.key, required this.title});
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
    items.add(HomeItems(name: Strings.wSelections));
    items.add(HomeItems(name: Strings.wDropdown));
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
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  itemClick(context, items[index].name, size);
                },
                child: Card(
                  margin: EdgeInsets.all(orientation == Orientation.portrait
                      ? size.height * 0.008
                      : size.width * 0.005),
                  child: Padding(
                    padding: EdgeInsets.all(orientation == Orientation.portrait
                        ? size.height * 0.02
                        : size.width * 0.015),
                    child: Text(items[index].name,
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.black54,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: orientation == Orientation.portrait
                                ? size.height * 0.02
                                : size.width * 0.015)),
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
  } else if (name == Strings.wIconBtn) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ButtonsDemo(title: name)));
  } else if (name == Strings.wImageView) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ImageViewDemo(title: name)));
  } else if (name == Strings.wSelections) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => SelectionsDemo(title: name)));
  } else if (name == Strings.wDropdown) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => DropdownDemo(title: name)));
  }
}
