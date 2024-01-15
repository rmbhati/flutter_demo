import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);*/
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  LoginDemoState createState() => LoginDemoState();
}

class LoginDemoState extends State<LoginDemo> {
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
              onPressed: () {
                /*Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));*/


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
