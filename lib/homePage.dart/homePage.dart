import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => MyStateFulWidgetMessengerApp();
}

class MyStateFulWidgetMessengerApp extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            widthFactor: 1,
            child: Container(
              height: 391,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Colors.blue[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 40,
                    offset: Offset(0, 0), // Shadow position
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/riadhImage.jpg",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[400],
        onPressed: () {
          //code to execute on button press
        },
        child: Icon(Icons.ac_unit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[200],
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            6, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: () {
                  //code
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
