import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class ButtonsDemo extends StatefulWidget {
  const ButtonsDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<ButtonsDemo> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: TextButton(
              onPressed: () {
                Constants.snackBar(context, "Button clicked", size);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              child: Text(
                "TextButton Normal",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.02),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(
              size.height * 0.02,
            ),
            child: TextButton(
              onPressed: () {
                Constants.snackBar(context, "TextButton Clicked", size);
              },
              child: Text(
                "Button With Container",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontSize: size.height * 0.02),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: TextButton.icon(
              onPressed: () {
                Constants.snackBar(context, "Button clicked", size);
              },
              icon: Icon(
                Icons.access_time,
                size: size.height * 0.025,
                color: Colors.white,
              ),
              label: Text("TextButton.icon",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.02)),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(size.width * 0.02),
                side: const BorderSide(width: 2.0, color: Colors.blue),
              ),
              onPressed: () {
                Constants.snackBar(context, "OutlinedButton clicked", size);
              },
              child: Text('OutlinedButton',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.02)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: OutlinedButton.icon(
              onPressed: () {
                Constants.snackBar(context, "OutlinedButton clicked", size);
              },
              icon: Icon(
                Icons.access_time,
                size: size.height * 0.025,
                color: Colors.black,
              ),
              label: Text("TextButton.icon",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.02)),
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(size.width * 0.02),
                  side: const BorderSide(width: 2.0, color: Colors.blue)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: const Chip(
              label: Text('Chip'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: const InputChip(
              avatar: Icon(Icons.remove),
              label: Text('InputChip'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: const ChoiceChip(
              selected: true,
              label: Text('ChoiceChip'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: const ActionChip(
              avatar: Icon(Icons.favorite),
              label: Text('Action 1'),
            ),
          ),
        ],
      ),
    );
  }
}
