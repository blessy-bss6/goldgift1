import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'bottomNav.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: coffeColor,
        centerTitle: true,
        title: Text('Order Complete',style: appBarTS,),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => navigationPushReplacement(context, UserNavigationBar(currentTab: 0,)),
        ),
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
