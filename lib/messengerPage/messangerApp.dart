import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class MessengerPage extends StatefulWidget {
  const MessengerPage({Key? key}) : super(key: key);

  @override
  State<MessengerPage> createState() => MyStateFulWidgetMessengerApp();
}

class MyStateFulWidgetMessengerApp extends State<MessengerPage> {
  var name = "+216 85 963 741";

  TextEditingController message = new TextEditingController();

  var linkImage = 'assets/images/personIcon.png';
  var enableMessage = false;

  Widget upWidgetOfMessenget(name) => Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 31,
            color: Colors.black,
          ),
          Padding(padding: EdgeInsets.only(left: 7)),
          Image.asset(
            '${linkImage}',
            width: 50,
            height: 50,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text('${name}'),
          Padding(
            padding: EdgeInsets.only(left: 88),
            child: Icon(
              Icons.call,
              size: 31,
              color: Colors.black,
            ),
          ),
        ],
      );

  Widget blockOfMessage(message) => Row(
        textDirection: TextDirection.rtl,
        children: [
          Padding(
            padding: EdgeInsets.all(6),
            child: CircleAvatar(
              radius: 10,
              child: Image.asset(
                '${linkImage}',
              ),
            ),
          ),
          Container(
            width: (message.length > 38 ? 300 : message.length * 8.1),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Text('${message}'),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 20,
              left: 20,
              child: upWidgetOfMessenget(name),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: (enableMessage == true
                      ? blockOfMessage(message.text)
                      : null),
                ),
                height: 610.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38.0),
                    topRight: Radius.circular(38.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[100],
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: message,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: true,
                    hintText: 'Message...',
                  ),
                ),
              ),
            ),
            IconButton(
              tooltip: 'Send',
              icon: const Icon(Icons.send),
              focusColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  this.enableMessage = true;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
