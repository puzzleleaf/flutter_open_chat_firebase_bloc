import 'package:flutter/material.dart';
import 'package:open_chat/models/chat_message.dart';

class ChatMessageItem extends StatelessWidget {
  final String id;
  final ChatMessage chat;

  const ChatMessageItem({Key key, this.id, this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMe = id == chat.senderId;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
            borderRadius: isMe ? BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ) : BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            )
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
            minHeight: 30,
          ),
          child: Text(chat.message, style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
          ),),
        )
      ],
    );
  }
}
