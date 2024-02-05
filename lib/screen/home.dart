import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/approval_list.dart';
import 'package:flutter_demo/screen/login.dart';
import 'package:flutter_demo/screen/widget_demo.dart';
import '../constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/home_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String userName = '';
  List<HomeItems> items = [];
  late Size size;

  @override
  void initState() {
    super.initState();
    initPreferences();
    items.add(HomeItems(name: "Approvals"));
    items.add(HomeItems(name: "Widgets"));
    items.add(HomeItems(name: "Menu 3"));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            toolbarHeight: size.height * 0.05,
            title: Text('Flutter Demo',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Mulish',
                    fontSize: size.height * 0.023)),
            automaticallyImplyLeading: false,
            elevation: 10,
            centerTitle: true,
            shape: const Border(
                bottom: BorderSide(color: Colors.black, width: 0.1)),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Constants.addIntSP(Constants.userId, 0);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: Icon(
                      Icons.arrow_circle_down,
                      size: size.height * 0.03,
                      color: Colors.white,
                    ),
                  )),
            ]),
        body: SizedBox(
            width: double.infinity,
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.black54,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.02),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  userName,
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.black54,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: size.height * 0.025),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (_, int index) {
                      return InkWell(
                          onTap: () {
                            moveNextPage(items[index].name);
                          },
                          child: Card(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                const Image(
                                    width: double.infinity,
                                    height: 60,
                                    //image: items[index].image,
                                    image: AssetImage('assets/kgk.png')),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(items[index].name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          letterSpacing: 1,
                                          color: Colors.black54,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0)),
                                )
                              ])));
                    }),
              )),
            ])));
  }

  initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString(Constants.userName)!;
    });
  }

  void moveNextPage(String from) {
    if (from == "Approvals") {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ApprovalsList(title: from)));
    } else if (from == "Widgets") {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => WidgetDemo(title: from)));
    } else {
      Constants.snackBar(context, from, size);
    }
  }
}
