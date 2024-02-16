import 'package:flutter/material.dart';

import '../../utils/constant.dart';

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);

  final String label;
  final Color color;
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);

  final String label;
  final IconData icon;
}

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownDemo extends StatefulWidget {
  const DropdownDemo({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WidgetState createState() => WidgetState();
}

class WidgetState extends State<DropdownDemo> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
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
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("DropdownButton Implementation",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: DropdownButton<String>(
                value: dropdownValue,
                // icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                  Constants.snackBar(context, dropdownValue, size);
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("DropdownMenu Implementation",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: DropdownMenu<String>(
                initialSelection: list.first,
                onSelected: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                  Constants.snackBar(context, dropdownValue, size);
                },
                inputDecorationTheme: InputDecorationTheme(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              )),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text("DropdownMenu with Autocomplete",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w500,
                    fontSize: size.height * 0.02)),
          ),
          Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownMenu<ColorLabel>(
                    initialSelection: ColorLabel.green,
                    controller: colorController,
                    requestFocusOnTap: true,
                    label: const Text('Color'),
                    onSelected: (ColorLabel? color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    inputDecorationTheme: InputDecorationTheme(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      constraints: BoxConstraints.tight(const Size.fromHeight(45)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    dropdownMenuEntries: ColorLabel.values
                        .map<DropdownMenuEntry<ColorLabel>>(
                            (ColorLabel color) {
                          return DropdownMenuEntry<ColorLabel>(
                            value: color,
                            label: color.label,
                            enabled: color.label != 'Grey',
                            style: MenuItemButton.styleFrom(
                              foregroundColor: color.color,
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(width: 20),
                  DropdownMenu<IconLabel>(
                    controller: iconController,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    leadingIcon: const Icon(Icons.search),
                    label: const Text('Icon'),
                    inputDecorationTheme: InputDecorationTheme(
                      isDense: true,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      constraints: BoxConstraints.tight(const Size.fromHeight(45)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSelected: (IconLabel? icon) {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    dropdownMenuEntries:
                    IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
                          (IconLabel icon) {
                        return DropdownMenuEntry<IconLabel>(
                          value: icon,
                          label: icon.label,
                          leadingIcon: Icon(icon.icon),
                        );
                      },
                    ).toList(),
                  ),
                ],
              )),
          if (selectedColor != null && selectedIcon != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    selectedIcon?.icon,
                    color: selectedColor?.color,
                  ),
                )
              ],
            )
          else
            const Text('Please select a color and an icon.')  ],
      ),
    );
  }
}
