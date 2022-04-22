import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop/Backend/Resp/prod_home_Resp.dart';
import 'reg_Login_Bloc.dart';

class ProdHomeBloc extends Bloc<ProdHomeEvent, RegisterState> {
  ProdHomeRespo prodResp = ProdHomeRespo();

  ProdHomeBloc() : super(InitialState()) {
    on<FetchHomeEvent>(_homeMethod);
    on<FetchProdEvent>(_prodMethod);
  }
  void _homeMethod(FetchHomeEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.homeResp();
      // print('user data $user');
      if (user == true) {
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }

  void _prodMethod(FetchProdEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.prodResp();
      // print('user data $user');
      if (user == true) {
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }
}

abstract class ProdHomeEvent extends Equatable {
  ProdHomeEvent();

  @override
  List<Object> get props => [];
}

// ! FIRST EVENT FOR FETCHING / INITIALIZE THE EVENT
class FetchHomeEvent extends ProdHomeEvent {
  final dynamic homeData;
  FetchHomeEvent({this.homeData});
  @override
  List<Object> get props => [];
}

class FetchProdEvent extends ProdHomeEvent {
  final dynamic prodData;
  FetchProdEvent({this.prodData});
  @override
  List<Object> get props => [];
}








// abstract class ProdHomeState extends Equatable {
//   const ProdHomeState();

//   @override
//   List<Object> get props => [];
// }

// class InitialState extends ProdHomeState {}

// class LoadingState extends ProdHomeState {}

// class SuccessState extends ProdHomeState {}

// class FailedState extends ProdHomeState {
//   final String? message;
//   FailedState({this.message});
// }
