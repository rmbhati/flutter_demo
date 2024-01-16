import 'package:flutter/material.dart';

class ApiConstants {
  //http://kgkdam.com:3910/kgkapi/smartservice/slogin/50226/LiveTest1234

  static String baseUrl = 'http://kgkdam.com:3910/kgkapi';
  static String usersEndpoint = '/smartservice/slogin/';

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
}
