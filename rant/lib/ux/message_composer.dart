import 'package:flutter/material.dart';

class Message {
  final String text;
  Message({this.text});
}

typedef MessageCallback = void Function(Message message);

class MessageComposer extends StatefulWidget {
  final MessageCallback onMessage;
  MessageComposer({this.onMessage});

  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  TextEditingController _inputController = TextEditingController(text: '');

  void send() {
    if (widget.onMessage != null) {
      final text = _inputController.text;
      final message = Message(text: text);
      widget.onMessage(message);
    }
    _inputController.clear();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      decoration: BoxDecoration(color: Colors.black, boxShadow: [
        BoxShadow(blurRadius: 3, spreadRadius: 0, color: Colors.grey)
      ]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _inputController,
                decoration: InputDecoration(
                    border: InputBorder.none, fillColor: Colors.white)),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: send,
          )
        ],
      ),
    );
  }
}
