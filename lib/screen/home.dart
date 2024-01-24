import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/login.dart';
import '../constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String userName = '';
  List<HomeItems> items = [];

  @override
  void initState() {
    super.initState();
    initPreferences();
    items.add(HomeItems(name: "Approvals"));
    items.add(HomeItems(name: "Menu 2"));
    items.add(HomeItems(name: "Menu 3"));
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
                      Constants.addIntSP(Constants.userId, 0);
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: const Icon(
                      Icons.arrow_circle_down,
                      size: 26.0,
                    ),
                  )),
            ]),
        body: SizedBox(
            width: double.infinity,
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
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
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  userName,
                  style: const TextStyle(
                      letterSpacing: 2,
                      color: Colors.black54,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0),
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
                            Constants.snackBar(context, items[index].name);
                          },
                          child: Card(
                              child: Column(children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Image(
                                  width: 50,
                                  height: 45,
                                  //image: items[index].image,
                                  image: AssetImage('assets/kgk.png')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(items[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      letterSpacing: 1,
                                      color: Colors.black54,
                                      fontFamily: "Mulish",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0)),
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
}

class HomeItems {
  String name;

  //Image image;

  HomeItems({
    required this.name,
    //required this.image,
  });
}
