part of 'chat_list_bloc.dart';

abstract class ChatListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatListStart extends ChatListEvent {}

class ChatListLoad extends ChatListEvent {
  final List<ChatRoomInfo> chatList;

  ChatListLoad({this.chatList});

  @override
  List<Object> get props => [chatList];
}

class ChatListAdd extends ChatListEvent {
  final String title;

  ChatListAdd({this.title});

  @override
  List<Object> get props => [title];
}