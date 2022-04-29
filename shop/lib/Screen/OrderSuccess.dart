import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import '../Backend/Bloc/reg_Login_Bloc.dart';
import 'bottomNav.dart';

class OrderCompleteScreen extends StatelessWidget {
  final String? email;
  const OrderCompleteScreen({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: coffeColor,
        centerTitle: true,
        title: Text(
          'Order Complete',
          style: appBarTS,
        ),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<RegisterBloc>(context, listen: false)
                ..add(SignUpBtnEvent(
                  email: email,context:context
                ));
              
            }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: ,
        children: [
          Center(
            child: Txt(
              t: 'Your Order has been                               \n        accepted',
              style: labelTextStyle,
            ),
          ),
          heightSizedBox(5.0),
          Center(
            child: Txt(
              t: "Your Items has been placed and is on \n It's way to being processed",
              style: smallTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
