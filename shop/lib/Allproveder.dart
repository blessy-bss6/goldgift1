import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import 'Backend/Bloc/cart_wishlist_Bloc.dart';
import 'Backend/Bloc/prod_home_Bloc.dart';
import 'Backend/Bloc/reg_Login_Bloc.dart';

class MainBloc {
  static List<SingleChildWidget> allBlocs() {
    return [
      BlocProvider(create: (ctx) => RegisterBloc()),
      BlocProvider(create: (ctx) => ProdHomeBloc()),
      BlocProvider(create: (ctx) => CartWishListBloc()),
    ];
  }
}
