import 'package:flutter/material.dart';

class Message {
  final String body;

  Message({this.body});
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
      final body = _inputController.text;
      final message = Message(body: body);
      widget.onMessage(message);
    }
    _inputController.clear();
  }

  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 24,
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
            iconSize: 24,
            color: Theme.of(context).primaryColor,
            onPressed: send,
          )
        ],
      ),
    );
  }
}
