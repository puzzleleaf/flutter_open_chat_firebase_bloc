import 'package:flutter/material.dart';
import 'package:open_chat/models/chat_room_info.dart';
import 'package:open_chat/utils/constants.dart';

class ChatListItem extends StatelessWidget {
  final ChatRoomInfo chatRoomInfo;

  const ChatListItem({Key key, this.chatRoomInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundImage: NetworkImage(chatRoomInfo.imgUrl),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  chatRoomInfo.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6a515e),
                  ),
                ),
                Text(
                  chatRoomInfo.lastMessage,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff6a515e),
                  ),
                )
              ],
            ),
          ),
          Text(Constants.millisecondsToFormatString(chatRoomInfo.lastModified)),
        ],
      ),
    );
  }
}
