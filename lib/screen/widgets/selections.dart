import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class SelectionsDemo extends StatefulWidget {
  const SelectionsDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<SelectionsDemo> {
  bool checkBox = false;
  bool isGame1 = false;
  bool isGame2 = false;
  int selectedOption = 1;
  bool isSwitch = false;

  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

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
            child: Text("Single Checkbox Implementation",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: CheckboxListTile(
                title: Text("Checkbox",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w500,
                        fontSize: size.height * 0.02)),
                value: checkBox,
                onChanged: (newValue) {
                  setState(() {
                    checkBox = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              )),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("Multi Checkbox Implementation",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: Text("Football",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w500,
                            fontSize: size.height * 0.02)),
                    value: isGame1,
                    onChanged: (newValue) {
                      setState(() {
                        isGame1 = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  CheckboxListTile(
                    title: Text("Hockey",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w500,
                            fontSize: size.height * 0.02)),
                    value: isGame2,
                    onChanged: (newValue) {
                      setState(() {
                        isGame2 = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2.0, color: Colors.blue),
                    ),
                    onPressed: () {
                      String data = '';
                      if (isGame1) {
                        data = 'Football';
                      }
                      if (isGame2) {
                        if (data == '') {
                          data = 'Hockey';
                        } else {
                          data = '$data, Hockey';
                        }
                      }
                      Constants.snackBar(context, 'Selected = $data', size);
                    },
                    child: Text('Checked Data',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.02)),
                  )
                ],
              )),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("Radio Buttons Implementation",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.01),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text('Male'),
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Female'),
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2.0, color: Colors.blue),
                    ),
                    onPressed: () {
                      String data = '';
                      if (selectedOption == 1) {
                        data = 'Male';
                      } else {
                        data = 'Female';
                      }
                      Constants.snackBar(context, 'Selected = $data', size);
                    },
                    child: Text('Checked Data',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: size.height * 0.02)),
                  )
                ],
              )),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("Switch Implementation",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Switch(
              value: isSwitch,
              onChanged: (bool value) {
                setState(() {
                  isSwitch = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Switch(
              thumbIcon: thumbIcon, value: isSwitch,
              onChanged: (bool value) {
                setState(() {
                  isSwitch = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
