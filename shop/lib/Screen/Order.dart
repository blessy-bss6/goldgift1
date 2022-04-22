import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/imgScr.dart';
import 'package:shop/common/order_cart_item.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import 'CheckOutScr.dart';
import 'OrderSuccess.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar

          SliverAppBars(
            title: 'Order Screen',
          ),

          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       // mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Txt(
          //           t: 'Delivery Address',
          //           style: labelTextStyle,
          //         ),
          //         OrderIdAdrContent(
          //           t2: 'batla House, Sikar,jaipur ',
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: borderColor)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Pics(
                        src: 'assets/images/indianGod.png',
                        width: 120,
                        height: 100,
                      ),
                      BasicProdDetail(cartBtn: false),
                    ],
                  ),
                ),
              ),
              childCount: 5,
            ),
          ),

          //  ! Sliver Product Content
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            height: 180,
            child: Column(
              children: [
                Expanded(child: Container(child: PriceList())),
                Btn(
                  height: 35,
                  width: double.infinity,
                  btnName: 'Order',
                  txtColor: txtWhiteColor,
                  color: coffeColor,
                  onTap: () => navigationPush(context, OrderCompleteScreen()),
                ),
              ],
            ),
          )),
    );
  }
}

class ExtraBodyContent extends StatelessWidget {
  const ExtraBodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ! Sliver app Bar

        SliverAppBars(
          title: 'Order Screen',
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Txt(
                  t: 'Delivery Address',
                  style: labelTextStyle,
                ),
                OrderIdAdrContent(
                  t2: 'batla House, Sikar,jaipur ',
                ),
              ],
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: borderColor)),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Pics(
                      src: 'assets/images/indianGod.png',
                      width: 120,
                      height: 100,
                    ),
                    BasicProdDetail(cartBtn: false),
                  ],
                ),
              ),
            ),
            childCount: 5,
          ),
        ),

        SliverToBoxAdapter(
          child: Column(
            children: [Divider(), PriceList()],
          ),
        ),

        //  ! Sliver Product Content
      ],
    );
  }
}
