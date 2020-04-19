import'package:flutter/material.dart';
import 'auth.dart';
import 'homepage.dart';
import 'globals.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}


Color backgroundColor = Color(0xFF242424);
Color appBarColor = Color(0xFF1B1B1B);
Color detailColor = Color(0xFFE040FB);

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("lib/assets/images/Logo.png"), width: 250.0, height: 250.0,),
              //FlutterLogo(size: 150),
              SizedBox(height: 30),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  // calls the method from sign_in.dart to bring up prompt to sign in with google and gain credentials
  Widget _signInButton(){
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        print("start of sign in");
        authService.googleSignIn().whenComplete(() {
          print("end of sign in");
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                createRecord();
                return HomePage();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("lib/assets/images/google_logo.png"), height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void createRecord() async {
    await databaseReference.collection("books")
        .document("1")
        .setData({
      'title': 'Mastering Flutter',
      'description': 'Programming Guide for Dart'
    });

  }

}
