import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  @override
  profilePageState createState() => new profilePageState();
}

class profilePageState extends State<profilePage> {
  var _name = 'Quam Nghiem';
  var _quote = 'Will Code For Money';
  var _language = 'C#, Java, C++, Javascript';

  createPopUp(BuildContext context) {
    TextEditingController newName = TextEditingController();
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
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter name'),
                    controller: newName,
                  ),
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
                  if (newName.text.toString().isNotEmpty) {
                    _name = newName.text.toString();
                  }
                  if (newQuote.text.toString().isNotEmpty) {
                    _quote = newQuote.text.toString();
                  }
                  if (newLanguage.text.toString().isNotEmpty) {
                    _language = newLanguage.text.toString();
                  }
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
      body: new Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blueAccent,
          ),
          ClipPath(
            child: Container(color: Colors.black),
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
                              image: NetworkImage(
                                  'https://pbs.twimg.com/profile_images/706187387290963969/85luv8tB_400x400.jpg'),
                              fit: BoxFit.cover),
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
