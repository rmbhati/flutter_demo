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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: TextButton(onPressed: () {  },
              child: Text(
                "TextButton Normal",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontSize: size.height * 0.02),
              ),

            ),
          ),
          Container(
            width: size.height * 0.3,
            decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(
                left: size.height * 0.02,
                right: size.height * 0.02,
                top: size.height * 0.01,
                bottom: 0.0),
            child: TextButton(
              onPressed: () {
                                 Constants.snackBar(
                      context, "TextButton Clicked", size);
                              },
              child: Text(
                "Strings.login",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontSize: size.height * 0.025),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Center(
                child: Text('Text Center',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black54,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.02)),
              )),
          Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Center(
                child: Text(
                    '--------------------------------------------------',
                    maxLines: 1,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black54,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.02)),
              )),
          Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: RichText(
              text: TextSpan(
                text: 'RichText ',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.1,
                    color: Colors.red),
                children: <TextSpan>[
                  TextSpan(
                      text: 'with',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.06,
                          color: Colors.green)),
                  TextSpan(
                      text: ' TextSpan!',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: size.width * 0.05,
                          color: Colors.blue)),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Center(
                child: Text(
                    '--------------------------------------------------',
                    maxLines: 1,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black54,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.02)),
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.025,
                  right: size.width * 0.025,
                  bottom: size.width * 0.025),
              child: TextFormField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "TextFormField used in Login page"),
              )),
          Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Center(
                child: Text(
                    '--------------------------------------------------',
                    maxLines: 1,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black54,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        fontSize: size.height * 0.02)),
              )),
        ],
      ),
    );
  }
}
