part of 'chat_room_bloc.dart';

abstract class ChatRoomEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatRoomLoad extends ChatRoomEvent {}

class SendMessage extends ChatRoomEvent {
  final ChatMessage chatMessage;

  SendMessage({this.chatMessage});

  @override
  List<Object> get props => [chatMessage];
}

class ReceiveMessage extends ChatRoomEvent {
  final List<ChatMessage> messages;

  ReceiveMessage({this.messages});

  @override
  List<Object> get props => [messages];
}
