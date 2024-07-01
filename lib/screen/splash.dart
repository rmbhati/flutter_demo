import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/home.dart';
import 'package:flutter_demo/screen/login/login_view.dart';

//import 'package:o3d/o3d.dart';
import '../utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  int userId = 0;

  //O3DController controller = O3DController();

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Center(
            child: Image(
                width: orientation == Orientation.portrait
                    ? size.height * 0.2
                    : size.width * 0.2,
                height: orientation == Orientation.portrait
                    ? size.height * 0.2
                    : size.width * 0.2,
                image: const AssetImage('assets/kgk.png'),
                fit: BoxFit.fill),
          );
        },
      ),
    );
  }

  initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getInt(Constants.userId) == null) {
        userId = 0;
      } else {
        userId = prefs.getInt(Constants.userId)!;
      }
    });

    Timer(const Duration(seconds: 1), () {
      if (userId == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Login()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Home()));
      }
    });
  }
}
