import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/login.dart';
import '../constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  int userId = 0;

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Image(
          width: double.infinity,
          height: double.infinity,
          image: AssetImage('assets/kgk.png')),
    );
  }

  initPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt(Constants.userId)!;
    });

    Timer(const Duration(seconds: 5), () {
      if (userId == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Login()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Home()));
      }
    }
    );
  }
}
