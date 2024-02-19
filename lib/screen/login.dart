import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constant.dart';
import '../model/login_model.dart';
import '../service/api_service.dart';

import '../utils/strings.dart';
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
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Center(
            child: ListView(shrinkWrap: true, children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.015),
                        child: SizedBox(
                          width: orientation == Orientation.portrait
                              ? size.height * 0.15
                              : size.width * 0.1,
                          height: orientation == Orientation.portrait
                              ? size.height * 0.15
                              : size.width * 0.1,
                          child:
                              Image.asset(fit: BoxFit.fill, 'assets/kgk.png'),
                        ),
                      ),
                      Text(
                        Strings.digJewLib,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: orientation == Orientation.portrait
                                ? size.height * 0.025
                                : size.width * 0.02,
                            fontFamily: 'Mulish'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: orientation == Orientation.portrait
                                ? size.height * 0.02
                                : size.width * 0.1,
                            right: orientation == Orientation.portrait
                                ? size.height * 0.02
                                : size.width * 0.1,
                            top: orientation == Orientation.portrait
                                ? size.height * 0.02
                                : size.width * 0.02,
                            bottom: 0),
                        child: TextFormField(
                          controller: userControl,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Strings.enterUserId;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person,
                                  size: orientation == Orientation.portrait
                                      ? size.height * 0.025
                                      : size.width * 0.02),
                              border: const OutlineInputBorder(),
                              hintText: Strings.enterUserId),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mulish',
                              fontSize: orientation == Orientation.portrait
                                  ? size.height * 0.02
                                  : size.width * 0.015),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: orientation == Orientation.portrait
                                ? size.height * 0.02
                                : size.width * 0.1,
                            right: orientation == Orientation.portrait
                                ? size.height * 0.02
                                : size.width * 0.1,
                            top: orientation == Orientation.portrait
                                ? size.height * 0.02
                                : size.width * 0.02,
                            bottom: orientation == Orientation.portrait
                                ? size.height * 0.01
                                : size.width * 0.005),
                        child: TextFormField(
                          obscureText: !passwordVisible,
                          controller: pwdControl,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return Strings.enterPassword;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,
                                  size: orientation == Orientation.portrait
                                      ? size.height * 0.025
                                      : size.width * 0.02),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    size: orientation == Orientation.portrait
                                        ? size.height * 0.025
                                        : size.width * 0.02,
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
                              hintText: Strings.enterPassword),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Mulish',
                              fontSize: orientation == Orientation.portrait
                                  ? size.height * 0.02
                                  : size.width * 0.015),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //TODO FORGOT PASSWORD SCREEN GOES HERE
                        },
                        child: Text(
                          Strings.forgotPassword,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Mulish",
                              fontSize: orientation == Orientation.portrait
                                  ? size.height * 0.02
                                  : size.width * 0.015),
                        ),
                      ),
                      Container(
                        width: orientation == Orientation.portrait
                            ? size.height * 0.3
                            : size.width * 0.25,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEFEFEF),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: orientation == Orientation.portrait
                                ? size.height * 0.015
                                : size.width * 0.005,
                            bottom: 0),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              loginAPICall(context);
                              //loginAPICallPost(context);
                            } else {
                              Constants.snackBar(
                                  context, Strings.enterAllDetails, size);
                            }
                          },
                          child: Text(
                            Strings.login,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Mulish",
//                              fontSize: size.height * 0.025
                                fontSize: orientation == Orientation.portrait
                                    ? size.height * 0.025
                                    : size.width * 0.02),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]),
          );
        },
      ),
    );
  }

  void loginAPICall(BuildContext context) async {
    Constants.loader(context, Strings.loading, size);
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
    Constants.snackBar(context, ddd, size);
  }

  void loginAPICallPost(BuildContext context) async {
    Constants.loader(context, Strings.loading, size);
    LoginModel loginModel = (await ApiService()
        .sendLoginPostRequest(context, userControl.text, pwdControl.text));
    String ddd;
    if (loginModel.sts == "True") {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    } else {
      ddd = "${loginModel.sts} : ${loginModel.message}";
    }
    Navigator.pop(context); //hide loader
    Constants.snackBar(context, ddd, size);
    //Navigator.push(context, MaterialPageRoute(builder: (_) => const Home()));
  }
}
