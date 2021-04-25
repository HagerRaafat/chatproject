import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  final User user;

  const ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedIndex = 0;
  final List<String> media = ['Chat', 'Media'];

  _buildMessage(Message message, bool isMe) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: isMe ? Theme.of(context).accentColor : Color(0xFFF3F7FA),
          ),
          margin: isMe
              ? EdgeInsets.only(
                  left: 150.0,
                  right: 20.0,
                  top: 10.0,
                  bottom: 10.0,
                )
              : EdgeInsets.only(
                  right: 150.0,
                  left: 20.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
          padding: EdgeInsets.all(10.0),
          child: Text(
            message.text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
              fontSize: 15.0,
            ),
          ),
        ),
        Container(
          margin: isMe
              ? EdgeInsets.only(
                  left: 150.0,
                  right: 20.0,
                )
              : EdgeInsets.only(
                  right: 150.0,
                  left: 20.0,
                ),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Text(
                'send at ${message.time} ',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                ),
              ),
              isMe
                  ? Icon(
                      Icons.done_all,
                      size: 15.0,
                      color: Theme.of(context).accentColor,
                    )
                  : Text(''),
            ],
          ),
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              margin: EdgeInsets.only(left: 11.0, top: 11.0, bottom: 11.0),
              decoration: BoxDecoration(
                color: Color(0xFFF3F7FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                cursorColor: Colors.blueGrey,
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              color: Color(0xFFF3F7FA),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              iconSize: 30.0,
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF3F7FA),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: IconButton(
              icon: Icon(Icons.mic_none_outlined),
              iconSize: 30.0,
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).accentColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            child: Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage(widget.user.imageUrl),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        widget.user.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Active now ',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 17.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call_outlined),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 40.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              height: 90.0,
              //color: Color(0xFF457B9D),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 8.5,
                        top: 37.0,
                        bottom: 13.0,
                        left: 8.5,
                      ),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: index == selectedIndex ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          media[index],
                          style: TextStyle(
                              color: index == selectedIndex
                                  ? Color(0xFF125589)
                                  : Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600
                              //fontWeight: FontWeight.bold,
                              //letterSpacing: 1.2,
                              ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  bool isMe = message.sender.id == currentUser.id;
                  return _buildMessage(message, isMe);
                },
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
