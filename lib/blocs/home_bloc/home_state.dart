part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final int page;

  HomeState(this.page);

  @override
  List<Object> get props => [page];
}

class HomeProfile extends HomeState {
  HomeProfile() : super(0);

}

class HomeChatList extends HomeState {
  HomeChatList() : super(1);
}
