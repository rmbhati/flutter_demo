import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/login_model.dart';
import '../model/user_model.dart';
import '../service/api_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  showAlertDialog(BuildContext context, LoginModel userModel) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    String ddd = "${userModel.sts} ${userModel.message}\nINFO\n${userModel.data?[0].empID} ${userModel.data?[0].fullName}";

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text(ddd),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: SizedBox(
                width: 200, height: 200, child: Image.asset('assets/kgk.png')),
          ),
          const Text(
            "Digital Jewelry Library",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontFamily: 'Mulish'),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20.0, top: 15, bottom: 0),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'User name or Email'),
              style: TextStyle(color: Colors.black, fontFamily: 'Mulish'),
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20.0, top: 15, bottom: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
              style: TextStyle(color: Colors.black, fontFamily: 'Mulish'),
            ),
          ),
          TextButton(
            onPressed: () {
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.black, fontFamily: "Mulish"),
            ),
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10, bottom: 0.0),
            child: TextButton(
              onPressed: () async {
                /*Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));*/

                LoginModel loginModel =
                    (await ApiService().getLoginData("50226", "LiveTest1234"));

                showAlertDialog(context, loginModel);
              },
              child: const Text(
                'LOG IN',
                style: TextStyle(color: Colors.black, fontFamily: "Mulish"),
              ),
            ),
          ),
        ],
      )),
      //],
      //),
      //)
    );
  }
}
