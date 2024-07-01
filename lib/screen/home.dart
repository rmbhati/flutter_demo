import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/approval_list.dart';
import 'package:flutter_demo/screen/login/login_view.dart';
import 'package:flutter_demo/screen/widgets/3dview.dart';
import 'package:flutter_demo/screen/widgets/html.dart';
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
  late Orientation orientation;
  int gridCount = 3;

  @override
  void initState() {
    super.initState();
    initPreferences();
    items.add(HomeItems(name: Strings.approvals));
    items.add(HomeItems(name: Strings.widgets));
    items.add(HomeItems(name: Strings.menu3));
    items.add(HomeItems(name: Strings.menu_html));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    orientation = MediaQuery.of(context).orientation;
    getOrientation();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            //toolbarHeight: Constants.getToolbarHeight(orientation),
            title: Text(Strings.digJewLib,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Mulish',
                    fontSize: orientation == Orientation.portrait
                        ? size.height * 0.023
                        : size.width * 0.018)),
            automaticallyImplyLeading: false,
            elevation: 10,
            centerTitle: true,
            shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 0.1)),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Constants.addIntSP(Constants.userId, 0);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => const Login()));
                    },
                    child: Icon(
                      Icons.arrow_circle_down,
                      size: orientation == Orientation.portrait
                          ? size.height * 0.03
                          : size.width * 0.022,
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
                      fontSize: orientation == Orientation.portrait
                          ? size.height * 0.02
                          : size.width * 0.015),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: Text(
                  userName,
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.black54,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: orientation == Orientation.portrait
                          ? size.height * 0.025
                          : size.width * 0.02),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: size.height * 0.01,
                        crossAxisSpacing: size.height * 0.01,
                        crossAxisCount: gridCount),
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
                                    height: orientation == Orientation.portrait
                                        ? size.height * 0.08
                                        : size.width * 0.08,
                                    image: const AssetImage('assets/kgk.png')),
                                Container(
                                  margin:  const EdgeInsets.only(top:5),
                                  child: Text(items[index].name,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Mulish",
                                          fontWeight: FontWeight.w600,
                                          fontSize: orientation == Orientation.portrait
                                              ? size.height * 0.02
                                              : size.width * 0.015)),
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
    }  else if (from == Strings.menu3) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ThreeDView(title: from)));
    } else if (from == Strings.menu_html) {
      //101413 //KE302632A
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => const HTMLView(title: "KE302632A")));
    /*  Navigator.push(context,
          MaterialPageRoute(builder: (_) => HTMLSent(title: "KE302632A")));*/
    } else {
      Constants.snackBar(context, from, size);
    }
  }

  void getOrientation() {
    Orientation orientation = MediaQuery.of(context).orientation;
    setState(() {
      if (orientation == Orientation.portrait) {
        gridCount = 3;
      } else {
        gridCount = 5;
      }
    });
  }
}
