import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Screen/bottomNav.dart';
import '../../utils/common.dart';
import '../Resp/reg_login_resp.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegLoginResp userRespository = RegLoginResp();

  RegisterBloc() : super(InitialState()) {
    // on<LoginBtnEvent>(_loginMethod);
    on<SignUpBtnEvent>(_registerMethod);
  }
  // void _loginMethod(LoginBtnEvent event, Emitter emit) async {
  //   // print(event);
  //   emit(LoadingState());
  //   try {
  //     var user = await userRespository.loginResp(
  //         email: event.email, password: event.password);
  //     // print('user data $user');
  //     if (user == true) {
  //       emit(SuccessState());
  //     }
  //     emit(InitialState());
  //   } catch (e) {
  //     emit(FailedState());
  //   }
  // }

  // ! SignUp
  void _registerMethod(SignUpBtnEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await userRespository.registerResp(
        email: event.email,
      );
      print('user data $user');
      if (user != false) {
        navigationPushReplacement(
            event.context,
            UserNavigationBar(
              currentTab: 0,
            ));
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }
}

// ! Event For Signup
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SignUpBtnEvent extends RegisterEvent {
  final String? email;
  dynamic context;
  SignUpBtnEvent({this.email, this.context});
}

class LoginBtnEvent extends RegisterEvent {
  final String? email, password;
  LoginBtnEvent({this.email, this.password});
}

// ! 3. STATE FOR REGISTER
abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class InitialState extends RegisterState {}

class LoadingState extends RegisterState {}

class SuccessState extends RegisterState {}

class FailedState extends RegisterState {
  final String? message;
  FailedState({this.message});
}
