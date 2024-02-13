import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/approval_list.dart';
import 'package:flutter_demo/screen/login.dart';
import 'package:flutter_demo/screen/widgets/widget_listing.dart';
import '../utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/home_model.dart';
import '../utils/strings.dart';

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
    items.add(HomeItems(name: Strings.approvals));
    items.add(HomeItems(name: Strings.widgets));
    items.add(HomeItems(name: Strings.menu3));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            toolbarHeight: size.height * 0.05,
            title: Text(Strings.digJewLib,
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
                  Strings.welcome,
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
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                                Image(
                                    width: double.infinity,
                                    height: size.height * 0.08,
                                    image: const AssetImage('assets/kgk.png')),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: size.width * 0.01),
                                  child: Text(items[index].name,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w600,
                                          fontSize: size.height * 0.02)),
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
    if (from == Strings.approvals) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ApprovalsList(title: from)));
    } else if (from == Strings.widgets) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => WidgetListing(title: from)));
    } else {
      Constants.snackBar(context, from, size);
    }
  }
}
