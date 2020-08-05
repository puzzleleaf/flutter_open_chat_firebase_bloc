import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_chat/blocs/chat_room_bloc/chat_room_bloc.dart';
import 'package:open_chat/models/chat_message.dart';
import 'package:open_chat/models/chat_room_info.dart';
import 'package:open_chat/models/user.dart';
import 'package:open_chat/screens/chat_room/chat_message_input.dart';
import 'package:open_chat/screens/chat_room/chat_message_item.dart';

class ChatRoomScreen extends StatelessWidget {
  final User user;
  final ChatRoomInfo chatRoomInfo;

  const ChatRoomScreen({Key key, this.user, this.chatRoomInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcf3f4),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'ChatRoom',
          style: TextStyle(
            fontSize: 22,
            color: Color(0xff6a515e),
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: BlocBuilder<ChatRoomBloc, ChatRoomState>(
        builder: (context, state) {
          if (state is ChatRoomLoadSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: <Widget>[
                          for (var i = 0; i < state.messages.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ChatMessageItem(
                                id: user.id,
                                chat: state.messages[i],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  ChatMessageInput(
                    onPressed: (message) {
                      BlocProvider.of<ChatRoomBloc>(context).add(
                        SendMessage(
                          chatMessage: ChatMessage(
                            senderId: user.id,
                            message: message,
                            time:
                                DateTime.now().millisecondsSinceEpoch.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Loading'),
            );
          }
        },
      ),
    );
  }
}
