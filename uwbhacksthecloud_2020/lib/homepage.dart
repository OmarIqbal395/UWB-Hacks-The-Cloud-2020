import 'package:flutter/material.dart';
import 'package:uwbhacksthecloud_2020/profilepage.dart';
import 'MatchCard.dart'; //card class will be here
import 'messagespage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation, fabButtonanim, infoAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    //edit as needed for our project
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: controller));

    fabButtonanim = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));

    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: controller));
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    controller.forward();
    return new AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: new AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.settings),
                iconSize: 20.0,
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => profilePage()));
                },
              ),
              title: new Text('Developers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black)),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: Icon(Icons.chat_bubble),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MessagesPage()));
                      },
                    ))
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 90.0),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
//                        Positioned(
//                          left: 20.0,
//                          child: Container(
//                            transform: Matrix4.translationValues(0.0, delayedCardAnimation.value * devHeight, 0.0),
//                            width: 260.0,
//                            height: 400.0,
//                            decoration: BoxDecoration(
//                                color: Colors.amber,
//                                borderRadius: BorderRadius.circular(10.0)),
//                          ),
//                        ),
//                        Positioned(
//
//                          left: 10.0,
//                          child: Container(
//                            transform: Matrix4.translationValues(0.0, cardAnimation.value * devHeight, 0.0),
//                            width: 280.0,
//                            height: 400.0,
//                            decoration: BoxDecoration(
//                                color: Colors.blue,
//                                borderRadius: BorderRadius.circular(10.0)),
//                          ),
//                        ),
                        Positioned(
                          top: -50.0,
                          right: -140.0,
                          height: 275.0,
                          width: 275.0,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "lib/assets/images/omarpro.jpeg"),
                                    //replace with network image later

                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          top: 50.0,
                          right: -185.0,
                          //padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            transform: Matrix4.translationValues(
                                0.0, 200.0, 0.0),
                            width: 370.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Colors.black12,
                                      spreadRadius: 2.0)
                                ]),
                            child: Container(
                              //padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Omar Iqbal',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(width: 4.0),
                                      SizedBox(width: 110.0),
                                      Text(
                                        'C++, Java, Python, C#, Dart',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 9.0),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Cloud Computing, Machine Learning.',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text( '' ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0,250.0,0.0,0.0),
                  transform: Matrix4.translationValues(
                      0.0, fabButtonanim.value * devHeight, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btn1",
                        elevation: 0.0,
                        onPressed: () {}, //x button
                        child: Icon(Icons.close, color: Colors.black),
                        backgroundColor: Colors.white,
                      ),
                      FloatingActionButton(
                        heroTag: "btn2",
                        elevation: 0.0,
                        onPressed: () {}, //like button
                        child: Icon(Icons.favorite, color: Colors.pink),
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
