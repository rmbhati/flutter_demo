import 'package:flutter/material.dart';
import '../constant.dart';
import '../model/login_model.dart';
import '../service/api_service.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final userControl = TextEditingController();
  final pwdControl = TextEditingController();

  @override
  void dispose() {
    userControl.dispose();
    pwdControl.dispose();
    super.dispose();
  }

  void loginAPICall(BuildContext context) async {
    Constants.loader(context, "Loading...");
    LoginModel loginModel =
        (await ApiService().getLoginData(userControl.text, pwdControl.text));
    String ddd;
    if (loginModel.sts == "true") {
      ddd =
          "${loginModel.sts} : ${loginModel.message}\nINFO\n${loginModel.data?[0].empID} ${loginModel.data?[0].fullName}";
      Constants.addIntSP("userId", loginModel.data![0].empID);
    } else {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    }
    Navigator.pop(context); //hide loader
    Constants.snackBar(context, ddd);
    //Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
  }

  void loginAPICallPost(BuildContext context) async {
    Constants.loader(context, "Loading...");
    LoginModel loginModel = (await ApiService()
        .sendLoginPostRequest(context, userControl.text, pwdControl.text));
    String ddd;
    if (loginModel.sts=="true") {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    } else {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    }
    Navigator.pop(context); //hide loader
    Constants.snackBar(context, ddd);
    //Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/kgk.png')),
              ),
              const Text(
                "Digital Jewelry Library",
                style: TextStyle(
                    color: Colors.black, fontSize: 22, fontFamily: 'Mulish'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: userControl,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter userid';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Userid'),
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Mulish'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 15, bottom: 15),
                child: TextFormField(
                  obscureText: true,
                  controller: pwdControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Password'),
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'Mulish'),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginAPICall(context);
                      //loginAPICallPost(context);
                    } else {
                      Constants.snackBar(context, "Please enter all details");
                    }
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
