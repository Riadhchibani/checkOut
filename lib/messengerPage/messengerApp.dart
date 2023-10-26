import 'package:app/ChatMessage.dart';
import 'package:app/homePage.dart/HomePage.dart';
import 'package:app/router/customRoutingApp.dart';
import 'package:flutter/material.dart';

class MessengerPage extends StatefulWidget {
  const MessengerPage({Key? key}) : super(key: key);

  @override
  State<MessengerPage> createState() => MyStateFulWidgetMessengerApp();
}

class MyStateFulWidgetMessengerApp extends State<MessengerPage> {
  static const USER_NAME = "Unknown";
  static const USER_STATUS = "Online";
  static const IMAGE_LINK = 'assets/images/personIcon.png';
  var enableMessage = false;
  var listOfMessage;
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messagerType: "receiver", statusUser : 'Online'),
    ChatMessage(messageContent: "How have you been?", messagerType: "receiver", statusUser : 'Online'),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "ehhhh, doing OK.", messagerType: "receiver", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
    ChatMessage(messageContent: "Is there any thing wrong?", messagerType: "sender", statusUser : 'Online'),
  ];

  TextEditingController message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.messages = this.messages.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(FromMenuRoute(prevPage: widget, nextPage: HomePage()));
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: USER_STATUS == 'Online' ? Color.fromARGB(255, 0, 212, 7) : Colors.grey,
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(IMAGE_LINK),
                    maxRadius: 20,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        USER_NAME,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        USER_STATUS,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              child: Container(
                child: ListView.builder(
                  reverse: true,
                    itemCount: messages.length,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment: (messages[index].messagerType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messagerType == "receiver"
                                  ? Colors.grey.shade200
                                  : Colors.blue[200]),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      messages[index].messagerType == "receiver"
                                          ? Colors.black
                                          : Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38.0),
                    topRight: Radius.circular(38.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[100],
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: message,
                  autofocus: false,
                  //enabled: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                    filled: true,
                    hintText: 'Message ...',
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

// No more concern
  @Deprecated("Old widget")
  Widget upWidgetOfMessenger(name) => Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 31,
              color: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 7)),
          Image.asset(
            IMAGE_LINK,
            width: 50,
            height: 50,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text('$name'),
          Padding(
            padding: EdgeInsets.only(left: 150),
            child: Icon(
              Icons.settings,
              size: 31,
              color: Colors.black,
            ),
          ),
        ],
      );

  @Deprecated("Old widget")
  Widget blockOfMessage(message) => Row(children: [
        Padding(
          padding: EdgeInsets.all(6),
          child: CircleAvatar(
            radius: 10,
            child: Image.asset(
              IMAGE_LINK,
            ),
          ),
        ),
        Container(
          width: (message.length > 38 ? 300 : message.length * 8.1),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Text('$message'),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ]);
}
