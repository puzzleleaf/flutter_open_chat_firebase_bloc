import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_chat/locator.dart';
import 'package:open_chat/models/user.dart';
import 'package:open_chat/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService = locator<AuthService>();

  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
      AuthEvent event) async* {
    if (event is AuthStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthLoggedIn) {
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthLoggedOut) {
      yield* _mapAuthenticationLoggedOutInToState();
    }
  }

  Stream<AuthState> _mapAuthenticationLoggedOutInToState() async* {
    yield AuthFailure();
    _authService.signOut();
  }

  Stream<AuthState> _mapAuthenticationLoggedInToState() async* {
    yield AuthSuccess(user: await _authService.getUser());
  }

  Stream<AuthState> _mapAuthenticationStartedToState() async* {
    final isSignedIn = await _authService.isSignedIn();
    if (isSignedIn) {
      final user = await _authService.getUser();
      yield AuthSuccess(user: user);
    } else {
      yield AuthFailure();
    }
  }
}
