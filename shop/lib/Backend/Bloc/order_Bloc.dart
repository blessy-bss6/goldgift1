import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Screen/OrderSuccess.dart';
import '../../utils/common.dart';
import '../../utils/shared_helper.dart';
import '../Resp/orderResp.dart';
import 'reg_Login_Bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  ShopC shoping = ShopC();
  OrderRespo orderResp = OrderRespo();

  OrderBloc() : super(OrderInitialState()) {
    on<FetchOrderEvent>(_orderMethod);

    // ====================ADD==========================
    on<OrderItemAddEvent>(_orderAddMethod);

    // // ! Update Order and Wishlist
    on<OrderShowEvent>(_orderShowMethod);

    // ! Delete Order and Wishlist
    on<OrderItemDelEvent>(_orderDeleteMethod);
  }

  //  ! Order Data Get

  void _orderMethod(FetchOrderEvent event, Emitter emit) async {
    // print(event);
    emit(OrderLoadingState());
    try {
      dynamic user = shoping.refreshItems();

      if (user != null) {
        emit(OrderSuccessState(data: user['data'], priceData: {
          "subPrice": user['subPrice'],
          "mrpPrice": user['mrpPrice'],
          "shipPrice": user['shipPrice']
        }));
      }
      // emit(OrderInitialState());
    } catch (e) {
      emit(OrderFailedState());
    }
  }

  // ! Order Show Method
  void _orderShowMethod(OrderShowEvent event, Emitter emit) async {
    // print(event);
    emit(OrderLoadingState());
    try {
      dynamic user = orderResp.orderGetDataResp();

      if (user != null) {
        emit(OrderSuccessState(data: user));
      }
      // emit(OrderInitialState());
    } catch (e) {
      emit(OrderFailedState());
    }
  }

  //  ============ Order AND WISHLIST PRODUCT ADD ======================
  void _orderAddMethod(OrderItemAddEvent event, Emitter emit) async {
    // print(event);
    emit(OrderLoadingState());
    try {
      
      dynamic user = orderResp.orderPostResp(
          lineItem: event.orderData,
          billing: event.billing,
          shipping: event.shipping,
          payMode: event.payMode,
          payTitle: event.payTitle);
      print(user);
      if (user != false) {
        
         
        navigationPush(event.context, OrderCompleteScreen());
       
        emit(OrderCompleteState());

      } else {
        // snackBar(event.context, user['msg'] ?? '');
        emit(OrderInitialState());
      }
    } catch (e) {
      emit(OrderFailedState());
    }
  }

  // ! Delete for Order AND WISHLIST
  void _orderDeleteMethod(OrderItemDelEvent event, Emitter emit) async {
    // print(event);
    emit(OrderLoadingState());
    try {
      dynamic user = orderResp.orderDeleteResp();

      if (user != null) {
        emit(OrderSuccessState(
          data: user,
        ));
      } else {
        emit(OrderInitialState());
      }
    } catch (e) {
      emit(OrderFailedState());
    }
  }
}

// ! Event for Order and WishList
abstract class OrderEvent extends Equatable {
  OrderEvent();

  @override
  List<Object> get props => [];
}

// ! FIRST EVENT FOR FETCHING / INITIALIZE THE EVENT
class FetchOrderEvent extends OrderEvent {
  FetchOrderEvent();
  @override
  List<Object> get props => [];
}

// 1 Order Item Add and Wishlist add
class OrderItemAddEvent extends OrderEvent {
  final dynamic orderData;
  final dynamic payMode;
  final dynamic billing;
  final dynamic shipping;
  final dynamic payTitle;
  final dynamic context;

  OrderItemAddEvent(
      {required this.orderData,
      this.billing,
      this.shipping,
      this.payMode,
      this.payTitle,
      this.context});
  @override
  List<Object> get props => [];
}

class OrderShowEvent extends OrderEvent {
  final dynamic prodData;
  final dynamic context;

  OrderShowEvent({this.prodData, this.context});
  @override
  List<Object> get props => [];
}

class OrderItemDelEvent extends OrderEvent {
  final int id;
  final dynamic context;
  OrderItemDelEvent({required this.id, this.context});
  @override
  List<Object> get props => [];
}

// / ! State in Order
abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderSuccessState extends OrderState {
  final dynamic data;
  final Map<String, dynamic>? priceData;
  OrderSuccessState({this.data, this.priceData});
}

class OrderCompleteState extends OrderState {}

class OrderFailedState extends OrderState {
  final String? message;
  OrderFailedState({this.message});
}
