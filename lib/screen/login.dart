import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool passwordVisible = false;
  late Size size;

  @override
  void dispose() {
    userControl.dispose();
    pwdControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          widthFactor: double.infinity,
          heightFactor: double.infinity,
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.015),
                    child: SizedBox(
                      width: size.height * 0.15,
                      height: size.height * 0.15,
                      child: Image.asset(fit: BoxFit.fill, 'assets/kgk.png'),
                    ),
                  ),
                  Text(
                    "Digital Jewelry Library",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.025,
                        fontFamily: 'Mulish'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.height * 0.02,
                        right: size.height * 0.02,
                        top: size.height * 0.02,
                        bottom: 0),
                    child: TextFormField(
                      //initialValue: '50226',
                      controller: userControl,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter userid';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.person, size: size.height * 0.025),
                          border: const OutlineInputBorder(),
                          hintText: 'Userid'),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mulish',
                          fontSize: size.height * 0.02),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.height * 0.02,
                        right: size.height * 0.02,
                        top: size.height * 0.02,
                        bottom: size.height * 0.02),
                    child: TextFormField(
                      obscureText: !passwordVisible,
                      //initialValue: 'LiveTest1234',
                      controller: pwdControl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            size: size.height * 0.025,
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                size: size.height * 0.025,
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              }),
                          border: const OutlineInputBorder(),
                          hintText: 'Password'),
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mulish',
                          fontSize: size.height * 0.02),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Mulish",
                          fontSize: size.height * 0.02),
                    ),
                  ),
                  Container(
                    width: size.height * 0.3,
                    decoration: BoxDecoration(
                        color: const Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(
                        left: size.height * 0.02,
                        right: size.height * 0.02,
                        top: size.height * 0.01,
                        bottom: 0.0),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginAPICall(context);
                          //loginAPICallPost(context);
                        } else {
                          Constants.snackBar(
                              context, "Please enter all details",size);
                        }
                      },
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Mulish",
                            fontSize: size.height * 0.025),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }

  void loginAPICall(BuildContext context) async {
    Constants.loader(context, "Loading...",size);
    LoginModel loginModel =
        (await ApiService().getLoginData(userControl.text, pwdControl.text));

    Navigator.pop(context); //hide loader/back press
    String ddd;
    if (loginModel.sts == "true") {
      ddd =
          "${loginModel.sts} : ${loginModel.message}\nINFO\n${loginModel.data?[0].empID} ${loginModel.data?[0].fullName}";
      Constants.addIntSP(Constants.userId, loginModel.data![0].empID);
      Constants.addStringSP(Constants.userName, loginModel.data![0].fullName);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Home()));
    } else {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    }
    Constants.snackBar(context, ddd,size);
  }

  void loginAPICallPost(BuildContext context) async {
    Constants.loader(context, "Loading...",size);
    LoginModel loginModel = (await ApiService()
        .sendLoginPostRequest(context, userControl.text, pwdControl.text));
    String ddd;
    if (loginModel.sts == "True") {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    } else {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    }
    Navigator.pop(context); //hide loader
    Constants.snackBar(context, ddd,size);
    //Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
  }
}
