import'package:flutter/material.dart';
import 'MatchCard.dart'; //card class will be here

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation, fabButtonanim, infoAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    //edit as needed for our project
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);

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
                onPressed: () {},
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
                    onPressed: () {},
                  )
                )
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
                        Container(
                          width: 100.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: AssetImage("lib/assets/images/picklerick.jpg"), //replace with network image later

                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          top: 320.0,
                          left: 15.0,
                          child: Container(
                            transform: Matrix4.translationValues(0.0, infoAnimation.value * devHeight, 0.0),
                            width: 270.0,
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
                              padding: EdgeInsets.all(7.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Simp God',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(width: 4.0),
                                      SizedBox(width: 110.0),
                                      Text(
                                        'C++, Java, Python, C#',
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
                                        'ea sports it\'s in the game.',
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
                        )
                      ],
                    )),
                Container(
                  transform: Matrix4.translationValues(0.0, fabButtonanim.value * devHeight, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        elevation: 0.0,
                        onPressed: () {}, //x button
                        child: Icon(Icons.close, color: Colors.black),
                        backgroundColor: Colors.white,
                      ),
                      FloatingActionButton(
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
