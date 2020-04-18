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
      leading: new Container(
          width: 60,
          height: 60,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://media-exp1.licdn.com/dms/image/C5603AQGpUBQcBTCWlg/profile-displayphoto-shrink_200_200/0?e=1592438400&v=beta&t=LFe2mDavF2qPsyTzaMiI4aoxfFTrOsxWNfQjBTF2UMI")
              )
          )),
      title: Text(document['project owner']),
      subtitle: Text(document['title']),
      onTap: () {
        // some stuff
      },
      onLongPress: () {
        // some other stuff
      },
    ),
  );
}