import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static Uri uri =
      Uri.parse("http://10.163.2.11:8080/kgkapi/login"); //post method
  static String baseUrl = 'http://kgkdam.com:3910/kgkapi'; //get method
  static String usersEndpoint = '/smartservice/slogin/';
  static String get_all_bc_count = '/api/a/sql/get_all_bc_count/all/';

  //Shared Preference saved data
  static String userId = 'userId';
  static String userName = 'userName';

  //Common Functions to user anywhere
  static alertDialog(BuildContext context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("My title"),
      content: Text(message),
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

  static snackBar(BuildContext context, String msg, Size size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(msg,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Mulish",
                  fontSize: size.height * 0.02)),
          duration: const Duration(seconds: 2)),
    );
  }

  static loader(BuildContext context, String msg, Size size) {
    AlertDialog alert = AlertDialog(
      content: Row(children: [
        SizedBox(
          height: size.height * 0.05,
          width: size.height * 0.05,
          child: const CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: size.height * 0.025),
            child: Text(msg,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Mulish",
                    fontSize: size.height * 0.025))),
      ]),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static double getToolbarHeight(Orientation orientation) {
    if (getDeviceType() == 'phone') {
      return orientation == Orientation.portrait ? 56 : 48;
    } else {
      return orientation == Orientation.portrait ? 64 : 56;
    }
  }

  static String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  static addIntSP(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static addStringSP(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
