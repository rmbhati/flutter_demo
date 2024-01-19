import 'package:flutter/material.dart';
import '../constant.dart';
import '../model/login_model.dart';
import '../service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late SharedPreferences prefs;
  String userName = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(Constants.userName)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text('Flutter Demo',
                style: TextStyle(fontFamily: 'Mulish', fontSize: 18.0)),
            automaticallyImplyLeading: false,
            elevation: 1,
            centerTitle: true,
            shape: const Border(
                bottom: BorderSide(color: Colors.black, width: 0.1)),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      //Constants.addIntSP("userId", 0);
                      Navigator.pop(context); //hide loader
                    },
                    child: const Icon(
                      Icons.arrow_circle_down,
                      size: 26.0,
                    ),
                  )),
            ]),
        body:  SizedBox(
            width: double.infinity,
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.black54,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  userName,
                  style: const TextStyle(
                      letterSpacing: 2,
                      color: Colors.black54,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0),
                ),
              )
            ])));
  }
}
