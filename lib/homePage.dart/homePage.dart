import 'package:flutter/cupertino.dart';
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

  showAlertDialog(BuildContext context, String _title, String _content) {
    Widget copyButton(_title) => Padding(
        padding: EdgeInsets.all(3),
        // ignore: deprecated_member_use
        child: FlatButton(
          child: Icon(
            Icons.copy,
            color: Colors.white,
          ),
          color: Colors.blue[100],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(19.0)),
          onPressed: () {},
        ));
    Widget forwardButton(_title) => Padding(
          padding: EdgeInsets.all(3),
          // ignore: deprecated_member_use
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              hoverColor: Colors.blue[50],
              icon: Icon(
                Icons.forward,
                color: Colors.blue[200],
              ),
              color: Colors.blue[100],
              onPressed: () {},
            ),
          ),
        );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Padding(
        padding: EdgeInsets.only(left: 50),
        child: Row(
          children: [
            copyButton(_content),
            forwardButton(_content),
          ],
        ),
      ),
      title: Text(
        '$_content',
        style: TextStyle(color: Colors.black.withOpacity(0.8)),
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
        child: FlatButton(
          child: Icon(
            _iconValue,
            color: Colors.white,
          ),
          color: Colors.blue[100],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(19.0)),
          onPressed: () {
            showAlertDialog(context, _title, _content);
          },
        ),
      ),
    );
  }

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
                          _templateButton(Icons.phone, 'Phone', '+21652385909'),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                child: Text(
                                  'in',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Colors.blue[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(19.0)),
                                onPressed: () {},
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
                              child: FlatButton(
                                child: SvgPicture.asset(
                                  'assets/SVGs/githubSVG.svg',
                                  color: Colors.white,
                                ),
                                color: Colors.blue[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(19.0)),
                                onPressed: () {},
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
