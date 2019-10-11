import 'dart:async';
import 'package:banksdev_flutter/events/authentication_event.dart';
import 'package:banksdev_flutter/repository/user_repository.dart';
import 'package:banksdev_flutter/states/authentication_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  // TODO: implement initialState
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    // TODO: implement mapEventToState
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        //LoggedIn
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}

/**
 * 
 * Stream<AuthenticationState> mapEventToState(
  AuthenticationEvent event,
) async* {
  if (event is AppStarted) {
    final bool hasToken = await userRepository.hasToken();

    if (hasToken) {
      yield AuthenticationAuthenticated();
    } else {
      yield AuthenticationUnauthenticated();
    }
  }

  if (event is LoggedIn) {
    yield AuthenticationLoading();
    await userRepository.persistToken(event.token);
    yield AuthenticationAuthenticated();
  }

  if (event is LoggedOut) {
    yield AuthenticationLoading();
    await userRepository.deleteToken();
    yield AuthenticationUnauthenticated();
  }
}
 */
