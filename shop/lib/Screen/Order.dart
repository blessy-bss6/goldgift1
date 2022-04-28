import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Backend/Bloc/order_Bloc.dart';
import 'package:shop/Backend/Resp/orderResp.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/imgScr.dart';
import 'package:shop/common/order_cart_item.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import '../Backend/Bloc/reg_Login_Bloc.dart';
import '../utils/shared_helper.dart';
import 'OrderSuccess.dart';

class OrderScreen extends StatefulWidget {
  final dynamic billing;
  final dynamic shipping;
  final dynamic description;
  OrderScreen({Key? key, this.billing, this.shipping, this.description})
      : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  dynamic priceData = 0;
  dynamic bottomBtn = false;
  dynamic cartData;
  ShopC shoping = ShopC();
  OrderRespo orderResp = OrderRespo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    priceData = shoping.refreshItems();

    // print(widget.billing);
    // print(widget.shipping);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => OrderBloc()..add(FetchOrderEvent()),
        child: BlocConsumer<OrderBloc, OrderState>(listener: (context, state) {
          print(state);
          if (state is OrderCompleteState) {
            BlocProvider.of<RegisterBloc>(context, listen: false)
              ..add(SignUpBtnEvent(
                email: widget.billing['email'],
              ));
          }
        }, builder: (context, state) {
          print(state);
          if (state is OrderSuccessState) {
            return state.data.length > 0
                ? CustomScrollView(
                    slivers: [
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
                                  border:
                                      Border.all(width: 1, color: borderColor)),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Pics(
                                    src: 'assets/images/indianGod.png',
                                    width: 120,
                                    height: 100,
                                  ),
                                  BasicProdDetail(
                                    prodNumber: state.data[i],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          childCount: state.data.length,
                        ),
                      )

                      //  ! Sliver Product Content
                    ],
                  )
                : CustomScrollView(slivers: [
                    // ! Sliver app Bar

                    SliverAppBars(
                      title: 'Order Screen',
                    ),
                    SliverToBoxAdapter(
                        child: Center(
                      child: Text('No Data'),
                    )),
                  ]);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            height: 180,
            child: Column(
              children: [
                // Expanded(child: Container(child: PriceList())),
                PriceList(
                  // prodNumber: priceData,
                  shipPrice: priceData['shipPrice'],
                  mrpPrice: priceData['mrpPrice'],
                  subPrice: priceData['subPrice'],
                ),
                Btn(
                    height: 35,
                    width: double.infinity,
                    btnName: 'Order',
                    txtColor: txtWhiteColor,
                    color: coffeColor,
                    onTap: () {
                      if (widget.billing != null) {
                        BlocProvider.of<OrderBloc>(context, listen: false)
                          ..add(OrderItemAddEvent(
                              orderData: priceData['orderData'],
                              billing: widget.billing,
                              shipping: widget.shipping,
                              context: context));
                      }
                    }),
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
