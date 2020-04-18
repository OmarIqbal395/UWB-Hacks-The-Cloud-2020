import 'dart:ui';

import'package:flutter/material.dart';
import 'globals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesPage extends StatefulWidget{
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagesPage>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Icon(Icons.mail, color: Colors.black),
                  Text(' Messages', style: TextStyle(color: Colors.black))
                ]
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // refresh
                },
              ),
            ],

          ),
        body: StreamBuilder(
          stream: databaseReference.collection('projects').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("Loading conversations..");
            }
            if (snapshot.data.documents.length == 0) {
              return Text("You have no project conversations - try liking some");
            }
            return ListView.builder(itemExtent: 80.0, itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) => _buildMessagesList(context, snapshot.data.documents[index]),
            );
          }
        )
      )
    );
  }
}

Widget _buildMessagesList(BuildContext context, DocumentSnapshot document) {
  return Card(
    //color: Color(),
    elevation: 4.0,

    child: ListTile(
//      trailing: IconButton(
//        icon: Icon(Icons.restore_from_trash, color: Colors.black),
//        onPressed: () {
//          // refresh
//        },
//      ),
      leading: new Container(
          width: 60,
          height: 60,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      document['url'])
              )
          )),
      title: Text(document['project owner']),
      subtitle: Text(document['title']),
      onTap: () {
        // stuff
      },
      onLongPress: () {
        // stuff
      },
    ),
  );
}