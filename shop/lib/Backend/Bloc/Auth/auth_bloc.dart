import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// !
class UserauthenticateBloc
    extends Bloc<UserauthenticateEvent, UserauthenticateState> {
  UserauthenticateBloc() : super(UserauthenticateInitial());

  // UserauthenticateState get initialState => AuthenticationUninitialized();

  Stream<UserauthenticateState> mapEventToState(
    UserauthenticateEvent event,
  ) async* {
    if (event is AppStarted) {
      try {
        yield AuthenticationUnauthenticated();
      } catch (e) {
        print(e);
      }
    }

    //  2. WHEN EVENT IS LOGIN
    if (event is SignedIn) {
      yield AuthenticationLoading();

      yield AuthenticatedAuthenticated();
    }

    /* -------------------------------------------------------------------------- */
    /*                                 LOGIN BLOC                                 */
    /* -------------------------------------------------------------------------- */
    //  2. WHEN EVENT IS LOGIN
    if (event is LoggedIn) {
      yield AuthenticationLoading();

      yield AuthenticatedAuthenticated();
    }

    // 3. WHEN EVENT IS LOGGOUT
    if (event is LoggedOut) {
      yield AuthenticationLoading();

      yield AuthenticationUnauthenticated();
    }
  }
}

// ! EVENT OF
abstract class UserauthenticateEvent extends Equatable {
  const UserauthenticateEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends UserauthenticateEvent {}

/* -------------------------------------------------------------------------- */
/*                                SIGNED EVENT                                */
/* -------------------------------------------------------------------------- */
class SignedIn extends UserauthenticateEvent {
  final String regtoken;
  SignedIn({required this.regtoken});

  @override
  List<Object> get props => [regtoken];

  @override
  String toString() => 'SigngedIn { regtoken: $regtoken }';
}

class LoggedIn extends UserauthenticateEvent {
  final String usertoken;
  // final bool usertoken;
  LoggedIn({required this.usertoken});

  @override
  List<Object> get props => [usertoken];

  @override
  String toString() => 'LoggedIn { usertoken: $usertoken }';
}

class LoggedOut extends UserauthenticateEvent {}

// ! State Class

abstract class UserauthenticateState extends Equatable {
  const UserauthenticateState();

  @override
  List<Object> get props => [];
}

class UserauthenticateInitial extends UserauthenticateState {}

class AuthenticationUninitialized extends UserauthenticateState {}

class AuthenticatedAuthenticated extends UserauthenticateState {}

class AuthenticationUnauthenticated extends UserauthenticateState {}

class AuthenticationLoading extends UserauthenticateState {}
