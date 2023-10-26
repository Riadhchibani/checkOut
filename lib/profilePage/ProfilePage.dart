import 'package:app/homePage.dart/HomePage.dart';
import 'package:app/messengerPage/MessengerApp.dart';
import 'package:app/router/customRoutingApp.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => MyStateFulWidgetMessengerApp();
}

class MyStateFulWidgetMessengerApp extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[200],
        onPressed: () {
          //code
        },
        child: Image.asset(
          'assets/images/logoAppFulter.png',
          color: Colors.white,
          width: 24,
          height: 24,
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[400],
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 6, //notche margin between floating button and bottom appbar
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
                onPressed: () {
                  Navigator.of(context).push(FromMenuRoute(prevPage: widget, nextPage: HomePage()));
                },
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
                  //Routing
                  Navigator.of(context).push(FromMenuRoute(prevPage: widget, nextPage: MessengerPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  }