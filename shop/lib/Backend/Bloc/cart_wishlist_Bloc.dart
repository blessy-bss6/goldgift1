import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/Backend/Resp/cart_wishlist_Resp.dart';

import 'reg_Login_Bloc.dart';

class CartWishListBloc extends Bloc<CartWishListEvent, RegisterState> {
  CartWishListRespo prodResp = CartWishListRespo();

  CartWishListBloc() : super(InitialState()) {
    on<FetchCartEvent>(_cartMethod);
    on<FetchWishListEvent>(_wishlistMethod);

    // ! Update cart and Wishlist
    on<CartItemPutEvent>(_cartUpdateMethod);
    on<WishlistItemPutEvent>(_wishlistUpdateMethod);

    // ! Delete Cart and Wishlist
    on<CartItemDelEvent>(_cartDeleteMethod);
    on<WishlistItemDelEvent>(_wishlistDeleteMethod);
  }

  //  ! Cart Data Get

  void _cartMethod(FetchCartEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.cartResp();
      // print('user data $user');
      if (user == true) {
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }

  void _wishlistMethod(FetchWishListEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.wishlistResp();
      // print('user data $user');
      if (user == true) {
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }

  // ! Update cart and WishlIst Item
  void _cartUpdateMethod(CartItemPutEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.cartUpdateResp();
      // print('user data $user');
      if (user == true) {
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }

  void _wishlistUpdateMethod(WishlistItemPutEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.wishlistUpdateResp();
      // print('user data $user');
      if (user == true) {
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }

  // ! Delete for CART AND WISHLIST
  void _cartDeleteMethod(CartItemDelEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.cartDeleteResp();
      // print('user data $user');
      if (user == true) {
        emit(SuccessState());
      }
      emit(InitialState());
    } catch (e) {
      emit(FailedState());
    }
  }

  void _wishlistDeleteMethod(WishlistItemDelEvent event, Emitter emit) async {
    // print(event);
    emit(LoadingState());
    try {
      var user = await prodResp.wishlistDeleteResp();
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

// ! Event for Cart and WishList
abstract class CartWishListEvent extends Equatable {
  CartWishListEvent();

  @override
  List<Object> get props => [];
}

// ! FIRST EVENT FOR FETCHING / INITIALIZE THE EVENT
class FetchCartEvent extends CartWishListEvent {
  final dynamic homeData;
  FetchCartEvent({this.homeData});
  @override
  List<Object> get props => [];
}

class FetchWishListEvent extends CartWishListEvent {
  final dynamic prodData;
  FetchWishListEvent({this.prodData});
  @override
  List<Object> get props => [];
}

class CartItemPutEvent extends CartWishListEvent {
  final dynamic prodData;
  CartItemPutEvent({this.prodData});
  @override
  List<Object> get props => [];
}

class WishlistItemPutEvent extends CartWishListEvent {
  final dynamic prodData;
  WishlistItemPutEvent({this.prodData});
  @override
  List<Object> get props => [];
}

class CartItemDelEvent extends CartWishListEvent {
  final dynamic prodData;
  CartItemDelEvent({this.prodData});
  @override
  List<Object> get props => [];
}

class WishlistItemDelEvent extends CartWishListEvent {
  final dynamic prodData;
  WishlistItemDelEvent({this.prodData});
  @override
  List<Object> get props => [];
}
