part of 'chat_list_bloc.dart';

abstract class ChatListState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChatListInitial extends ChatListState {}

class ChatListLoading extends ChatListState {}

class ChatListLoadSuccess extends ChatListState {
  final List<ChatRoomInfo> chatList;

  ChatListLoadSuccess({this.chatList});

  @override
  List<Object> get props => [chatList];
}

class ChatListAdding extends ChatListState {}

class ChatListAddSucecss extends ChatListState {}
