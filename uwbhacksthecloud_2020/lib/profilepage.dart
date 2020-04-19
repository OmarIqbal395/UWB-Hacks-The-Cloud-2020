import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class profilePage extends StatefulWidget {
  @override
  profilePageState createState() => new profilePageState();
}

class profilePageState extends State<profilePage> {
  var _name = 'User';
  var _quote = 'About you';
  var _language = 'N/A';
  var _image =
      'https://brightguyfilms.com/wp-content/uploads/2016/06/avatar-blank-male.png';
  var _email = 'My contact info';

  @override
  void initState() {
    super.initState();
    getData();
  }

  createPopUp(BuildContext context) {
//    TextEditingController newEmail = TextEditingController();
    TextEditingController newQuote = TextEditingController();
    TextEditingController newLanguage = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Your new information!"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
//                  TextField(
//                    decoration: InputDecoration(hintText: 'Enter email'),
//                    controller: newEmail,
//                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter quote'),
                    controller: newQuote,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter language'),
                    controller: newLanguage,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Submit'),
                onPressed: () {
                  if (newQuote.text.toString().isNotEmpty) {
                    _quote = newQuote.text.toString();
                  }
                  if (newLanguage.text.toString().isNotEmpty) {
                    _language = newLanguage.text.toString();
                  }
//                  if (newEmail.text.toString().isNotEmpty) {
//                    _email = newEmail.text.toString();
//                  }
                  updateData(_quote, _language);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
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
            children: <Widget>[
              Icon(Icons.person, color: Colors.black),
              Text(' Profile', style: TextStyle(color: Colors.black))
            ]),
        actions: <Widget>[
        ],
      ),
      body: new Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blueAccent,
          ),
          ClipPath(
            child: Container(color: Colors.lightBlueAccent),
            clipper: getClipper(),
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height / 8,
              child: Column(
                children: <Widget>[
                  Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(_image)),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 5.0, color: Colors.black)
                          ])),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    _name,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "About Me:",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _quote,
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Coding Language:",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _language,
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "My contact info:",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _email,
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () => setState(() {
          createPopUp(context);
        }),
        child: Icon(Icons.edit),
      ),
    );
  }

  void getData() async {
    DocumentSnapshot temp = await Firestore.instance
        .collection('users')
        .document('GxA91zTAXAOA285fNQ0YUcsW1LD2')
        .get();
    String imageUrl = temp['photoURL'];
    String name = temp['displayName'];
    _image = imageUrl;
    _name = name;
    _quote = temp['summary'];
    _language = temp['language'];
    _email = temp['email'];
  }

  void updateData(String summary, String language) {
    try {
      Firestore.instance
          .collection('users')
          .document('GxA91zTAXAOA285fNQ0YUcsW1LD2')
          .updateData({'language': language, 'summary': summary});
    } catch (e) {
      print(e.toString());
    }
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height / 2.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
