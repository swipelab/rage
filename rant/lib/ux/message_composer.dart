import 'package:flutter/material.dart';

typedef MessageCallback = void Function(String message);

class MessageComposer extends StatefulWidget {
  final MessageCallback onMessage;
  MessageComposer({this.onMessage});

  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  TextEditingController _inputController = TextEditingController(text: '');

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      decoration: BoxDecoration(color: Colors.transparent,
          boxShadow: [
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
              decoration:
                  InputDecoration(border: InputBorder.none, fillColor: Colors.white)
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              final text = _inputController.text;
              if (widget.onMessage != null) {
                widget.onMessage(text);
              }
              _inputController.clear();
            },
          )
        ],
      ),
    );
  }
}
