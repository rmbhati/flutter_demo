import 'package:flutter/material.dart';
import 'package:flutter_demo/constant.dart';
import 'package:flutter_demo/model/approvals_model.dart';
import 'package:flutter_demo/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApprovalsList extends StatefulWidget {
  const ApprovalsList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  ApprovalsState createState() => ApprovalsState();
}

class ApprovalsState extends State<ApprovalsList> {
  int userId = 0;
  List<ApproveData> data = [];

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
      Constants.loader(context, "Loading...");
      ApproveModel result = (await ApiService().getApprovalsData(userId));
      if (result.sts) {
        Navigator.pop(context); //hide loader/back press
        setState(() {
          data = result.data!;
        });
      } else {
        Navigator.pop(context); //hide loader/back press
        Constants.snackBar(context, result.message);
      }
    }
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
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Constants.snackBar(context, data[index].code);
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text("${data[index].code} (${data[index].count})",
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black54,
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0)),
                          ),
                        ])),
                  ));
            })); // Here you direct access using widget
  }
}
