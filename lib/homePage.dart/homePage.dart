import 'package:app/messengerPage/MessengerApp.dart';
import 'package:app/profilePage/ProfilePage.dart';
import 'package:app/router/customRoutingApp.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => MyStateFulWidgetMessengerApp();
}

class MyStateFulWidgetMessengerApp extends State<HomePage> {
  double _height = 391.0;
  var _hide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  widthFactor: 1,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: this._height,
                    child: Container(
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
                  )),
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.only(top: _height - 55),
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/riadhImage.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              _hide == true
                  ? Container()
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: _height + 55),
                        child: Text(
                          'Riadh Chibani',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: RotatedBox(
              quarterTurns: _hide == false ? 3 : 1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _height == 231 ? _height = 391 : _height = 231;
                    Future.delayed(Duration(milliseconds: 200));
                    _hide == true ? _hide = false : _hide = true;
                  });
                },
                icon: Icon(
                  Icons.double_arrow_rounded,
                ),
              ),
            ),
          ),
          this._hide == true
              ? Container(
                  padding: EdgeInsets.only(left: 68, top: 35),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _templateButton(
                              Icons.mail, 'Gmail', 'riadhchibani144@gmail.com'),
                          _templateButton(Icons.phone, 'Phone', '+216 52 385 909'),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              // ignore: deprecated_member_use
                              child: TextButton(
                                child: Text(
                                  'in',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                /*color: Colors.blue[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(19.0),
                                ),*/
                                onPressed: () {
                                  showAlertDialog(
                                    context,
                                    'Linkedin',
                                    'https://www.linkedin.com/in/chibani-riadh-4260a71a1/',
                                    Icons.search,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              // ignore: deprecated_member_use
                              child: TextButton(
                                child: SvgPicture.asset(
                                  'assets/SVGs/githubSVG.svg',
                                  color: Colors.white,
                                ),
                                /*color: Colors.blue[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(19.0)),*/
                                onPressed: () {
                                  showAlertDialog(
                                    context,
                                    'GitHub',
                                    'https://github.com/Riadhchibani',
                                    Icons.search,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[200],
        onPressed: () {
          //code
          Navigator.of(context).push(FromMenuRoute(prevPage: widget, nextPage: ProfilePage()));
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
                  //Navigator.of(context).push(FromMenuRoute(prevPage: widget, nextPage: HomePage()));
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

showAlertDialog(BuildContext context, String _title, String _content, IconData _iconData) {
    Widget copyButton(_title) => Padding(
          padding: EdgeInsets.all(3),
          // ignore: deprecated_member_use
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.transparent,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.copy,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
          ),
        );
        Widget forwardButton(_title, _iconType) => Padding(
          padding: EdgeInsets.all(3),
          // ignore: deprecated_member_use
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.transparent,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                _iconType,
                color: Colors.grey,
              ),
              enableFeedback: false,
              onPressed: null,
            ),
          ),
        );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        padding: EdgeInsets.only(left: 70, right: 30),
        child: Row(
          children: [
            copyButton(_content),
            forwardButton(_content, _iconData),
          ],
        ),
      ),
      title: Text(
        '$_content',
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 19,
        ),
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _templateButton(IconData _iconValue, String _title, String _content) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        height: 50.0,
        width: 50.0,
        // ignore: deprecated_member_use
        child: TextButton(
          child: Icon(
            _iconValue,
            color: Colors.black,
          ),
          /*color: Colors.blue[100],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(19.0)),*/
          onPressed: () {
            showAlertDialog(context, _title, _content, _iconValue);
          },
        ),
      ),
    );
  }
}
