part of 'chat_room_bloc.dart';

abstract class ChatRoomState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatRoomInitial extends ChatRoomState {}

class ChatRoomLoading extends ChatRoomState {}

class ChatRoomLoadSuccess extends ChatRoomState {
  final List<ChatMessage> messages;

  ChatRoomLoadSuccess({this.messages});

  @override
  List<Object> get props => [messages];
}

class ChatRoomLoadFailure extends ChatRoomState {}
