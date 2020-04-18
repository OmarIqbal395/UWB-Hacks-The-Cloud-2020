import'package:flutter/material.dart';
import 'auth.dart';

class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {},

          ),
          title: new Text('Project',
              style: TextStyle(
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black)

          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
                colors: Colors.blue,
                size: 40.0,


              ),
            )



          ]

      ),
      body: new Center(


      ),
    );
  }





}//end of class
