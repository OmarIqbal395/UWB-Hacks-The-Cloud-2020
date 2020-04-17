import'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //FlutterLogo(size: 150),
              SizedBox(height: 30),
              //_signInButton(),
            ],
          ),
        ),
      ),
    );
  }

}