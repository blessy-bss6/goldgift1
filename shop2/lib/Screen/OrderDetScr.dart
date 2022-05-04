import 'package:flutter/material.dart';

import '../Backend/Resp/payment_Resp.dart';
import '../Elements/baseAppbar.dart';
import '../Elements/button.dart';

import '../utils/style.dart';

import 'OrderHistory.dart';
import 'OrderTracking.dart';

class OrderDeatilsScreen extends StatefulWidget {
  const OrderDeatilsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDeatilsScreen> createState() => _OrderDeatilsScreenState();
}

class _OrderDeatilsScreenState extends State<OrderDeatilsScreen> {
  dynamic pageName = 'Tracking';
  PaymentResp payresp = PaymentResp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          centerTitle: true,
          title: 'Order Details ',
          // bottomChild: Row(
          //   children: [
          //     Expanded(
          //         child: Btn(
          //       // margin: EdgeInsets.all(2),
          //       onTap: () => setState(() => pageName = 'Tracking'),
          //       height: 20,
          //       btnName: 'Tracking',
          //       color: pageName == 'Tracking' ? yellowColor : coffeColor,
          //       txtColor: txtWhiteColor,
          //     )),
          //     Expanded(
          //         child: Btn(
          //       // margin: EdgeInsets.all(2),
          //       onTap: () => setState(() => pageName = 'History'),
          //       height: 20,
          //       btnName: 'History',
          //       color: pageName == 'History' ? yellowColor : coffeColor,
          //       txtColor: txtWhiteColor,
          //     ))
          //   ],
          // ),
        ),
        body: Container(
          child: OrderTrackingScreen(),
          // child: Center(
          //   child: InkWell(
          //       onTap: () {
          //         payresp.paymentRefundResp(
          //             transcationId: "pay_JR9DO38jCAzN4c",
          //             ammount: int.parse(2.toString()));
          //       },
          //       child: Container(
          //         margin: EdgeInsets.symmetric(horizontal: 6),
          //         alignment: Alignment.topRight,
          //         child: Txt(
          //           t: 'Cancel',
          //           color: redColor,
          //         ),
          //       )),
          // ),
        ));
    // body: Container(
    //   child: pageName == 'History'
    //       ? OrderHistoryScreen()
    //       : OrderTrackingScreen(),
    // ));
  }
}
