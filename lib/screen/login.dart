import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/api_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  void _getData() async {
    List<UserModel>? _userModel = (await ApiService().getUsers())!;
    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  showAlertDialog(BuildContext context, List<UserModel> userModel) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text(userModel.toString()),
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
                //_getData();

                List<UserModel>? _userModel = (await ApiService().getUsers())!;
                showAlertDialog(context, _userModel);
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

class _LoginState extends State<Login> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
