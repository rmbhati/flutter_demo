import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Image(
            width: size.height * 0.2,
            height: size.height * 0.2,
            image: const AssetImage('assets/kgk.png'),
            fit: BoxFit.fill),
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

    Timer(const Duration(seconds: 2), () {
      if (userId == null || userId == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Login()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Home()));
      }
    });
  }
}
