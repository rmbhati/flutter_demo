import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/constant.dart';
import 'package:flutter_demo/model/approvals_model.dart';
import 'package:flutter_demo/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/strings.dart';

class ApprovalsList extends StatefulWidget {
  const ApprovalsList({super.key, required this.title});
  final String title;

  @override
  ApprovalsState createState() => ApprovalsState();
}

class ApprovalsState extends State<ApprovalsList> {
  int userId = 0;
  late Size size;
  TextEditingController controller = TextEditingController();
  List<ApproveData> data = [];
  List<ApproveData> searchData = [];

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt(Constants.userId)!;
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    if (userId != 0) {
      Constants.loader(context, Strings.loading, size);
      ApproveModel result = (await ApiService().getApprovalsData(userId));
      if (result.sts) {
        Navigator.pop(context); //hide loader/back press
        setState(() {
          data = result.data!;
        });
      } else {
        Navigator.pop(context); //hide loader/back press
        Constants.snackBar(context, result.message, size);
      }
    }
  }

  onSearchTextChanged(String text) async {
    searchData.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    for (var userDetail in data) {
      if (userDetail.code.toLowerCase().contains(text.toLowerCase())) {
        searchData.add(userDetail);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;
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
          children: [
            Card(
              elevation: 5,
              //color: Colors.blue,
              margin: EdgeInsets.all(orientation == Orientation.portrait
                  ? size.height * 0.008
                  : size.width * 0.005),
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                    FocusScope.of(context).unfocus(); //hide keyboard
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
            Expanded(
                child:

              searchData.isNotEmpty || controller.text.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Constants.snackBar(
                                context, searchData[index].code, size);
                          },
                          child: Card(
                            margin: EdgeInsets.all(
                                orientation == Orientation.portrait
                                    ? size.height * 0.008
                                    : size.width * 0.005),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  orientation == Orientation.portrait
                                      ? size.height * 0.02
                                      : size.width * 0.015),
                              child: Text(
                                  "${searchData[index].code} (${searchData[index].count})",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black54,
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          orientation == Orientation.portrait
                                              ? size.height * 0.02
                                              : size.width * 0.015)),
                            ),
                          ),
                        );
                      })
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Constants.snackBar(context, data[index].code, size);
                          },
                          child: Card(
                            margin: EdgeInsets.all(
                                orientation == Orientation.portrait
                                    ? size.height * 0.008
                                    : size.width * 0.005),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  orientation == Orientation.portrait
                                      ? size.height * 0.02
                                      : size.width * 0.015),
                              child: Text(
                                  "${data[index].code} (${data[index].count})",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black54,
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          orientation == Orientation.portrait
                                              ? size.height * 0.02
                                              : size.width * 0.015)),
                            ),
                          ),
                        );
                      }),
            )
          ],
        )); // Here you direct access using widget
  }
}
