import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeProfile());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is ChangeProfile) {
      yield* _mapChangeProfileToState();
    } else if (event is ChangeChatList) {
      yield* _mapChangeChatListToState();
    }
  }

  Stream<HomeProfile> _mapChangeProfileToState() async* {
    yield HomeProfile();
  }

  Stream<HomeChatList> _mapChangeChatListToState() async* {
    yield HomeChatList();
  }
}
