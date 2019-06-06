import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _submitted(String text) {
    _textEditingController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget textcomposerwidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.greenAccent),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration:
                      new InputDecoration.collapsed(hintText: "Send Message"),
                  controller: _textEditingController,
                  onSubmitted: _submitted,
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: new Icon(
                    Icons.send,
                  ),
                  onPressed: () => _submitted(_textEditingController.text),
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(
            height: 1,
          ),
          new Container (
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
            ),
            child: textcomposerwidget(),
          )
        ],
      );
  }
}
