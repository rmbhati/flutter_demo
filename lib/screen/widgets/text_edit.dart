import 'package:flutter/material.dart';

class TextEditDemo extends StatefulWidget {
  const TextEditDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<TextEditDemo> {
  final textFieldUser = TextEditingController();
  final textFieldPwd = TextEditingController();

  @override
  void dispose() {
    textFieldUser.dispose();
    textFieldPwd.dispose();
    super.dispose();
  }

  //TextFormField
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  AppBar(
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
            padding: EdgeInsets.all(size.width * 0.01),
            child: DefaultTextStyle.merge(
              style: TextStyle(
                fontSize: size.height * 0.05,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
              child: const Text('DefaultTextStyle'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: Text('Text Left',
                style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.black54,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.02)),
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
                    fontSize: size.height * 0.1,
                    color: Colors.red),
                children: <TextSpan>[
                  TextSpan(
                      text: 'with',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.height * 0.06,
                          color: Colors.green)),
                  TextSpan(
                      text: ' TextSpan!',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: size.height * 0.05,
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
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
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: TextField(
                controller: textFieldUser,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(
    color: Colors.black,
    fontFamily: 'Mulish',
    fontSize: size.height * 0.02),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, size: size.height * 0.025),
                  border: const OutlineInputBorder(),
                  labelText: 'TextField as Username',
                )),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: TextField(
              controller: textFieldPwd,
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thanks!'),
                      content: Text(
                          'Username ${textFieldUser.text}\npassword $value'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              obscureText: true,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Mulish',
                  fontSize: size.height * 0.02), decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: size.height * 0.025),
                suffixIcon: IconButton(
                    icon: Icon(
                      size: size.height * 0.025,
                      Icons.visibility,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {}),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'TextField Reading values',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
