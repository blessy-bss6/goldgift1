import 'package:flutter/material.dart';

import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/common/orderContent.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'OrderHistory.dart';
import 'OrderTracking.dart';

class OrderDeatilsScreen extends StatefulWidget {
  const OrderDeatilsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDeatilsScreen> createState() => _OrderDeatilsScreenState();
}

class _OrderDeatilsScreenState extends State<OrderDeatilsScreen> {
  dynamic pageName = 'Tracking';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          centerTitle: true,
          title: 'Order Details ',
          bottomChild: Row(
            children: [
              Expanded(
                  child: Btn(
                // margin: EdgeInsets.all(2),
                onTap: () => setState(() => pageName = 'Tracking'),
                height: 20,
                btnName: 'Tracking',
                color: pageName == 'Tracking' ? yellowColor : coffeColor,
                txtColor: txtWhiteColor,
              )),
              Expanded(
                  child: Btn(
                // margin: EdgeInsets.all(2),
                onTap: () => setState(() => pageName = 'History'),
                height: 20,
                btnName: 'History',
                color: pageName == 'History' ? yellowColor : coffeColor,
                txtColor: txtWhiteColor,
              ))
            ],
          ),
        ),
        body: Container(
          child: pageName == 'History'
              ? OrderHistoryScreen()
              : OrderTrackingScreen(),
        ));
  }
}
