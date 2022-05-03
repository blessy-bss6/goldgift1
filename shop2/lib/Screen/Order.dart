import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/Screen/paymentScr.dart';
import '../Backend/Bloc/order_Bloc.dart';
import '../Backend/Resp/orderResp.dart';
import '../Elements/baseAppbar.dart';
import '../Elements/button.dart';
import '../Elements/imgScr.dart';
import '../common/order_cart_item.dart';
import '../utils/common.dart';
import '../utils/style.dart';

import '../Backend/Bloc/reg_Login_Bloc.dart';
import '../utils/shared_helper.dart';
import 'OrderSuccess.dart';

class OrderScreen extends StatefulWidget {
  final dynamic billing;
  final dynamic shipping;
  final dynamic description;
  final bool? isLogin;
  final String? password;
  final dynamic userId;
  OrderScreen(
      {Key? key,
      this.billing,
      this.shipping,
      this.password,
      this.description,
      this.userId,
      this.isLogin})
      : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  dynamic priceData = 0;
  dynamic bottomBtn = true;
  dynamic cartData;
  ShopC shoping = ShopC();
  OrderRespo orderResp = OrderRespo();
  OrderBloc orderB = OrderBloc();

  @override
  void initState() {
    // TODO: implement initState
    priceData = shoping.refreshItems();
    orderB = BlocProvider.of<OrderBloc>(context, listen: false);
    orderB.add(FetchOrderEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // BlocProvider(
          //   create: (BuildContext context) => OrderBloc()..add(FetchOrderEvent()),
          //   child:
          BlocConsumer<OrderBloc, OrderState>(listener: (context, state) {
        print(state);
        if (state is OrderCompleteState) {
          if (widget.isLogin == false) {
            BlocProvider.of<AuthBloc>(context, listen: false)
              ..add(SignUpBtnEvent(
                  email: widget.billing['email'],
                  password: widget.password,
                  username: widget.billing['email']));
            navigationPush(
                context,
                OrderCompleteScreen(
                  orderId: state.data['id'],
                ));
          } else {
            navigationPush(context, OrderCompleteScreen());
          }
        }
      }, builder: (context, state) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      // ),
      bottomNavigationBar: bottomBtn == false
          ? null
          : Padding(
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
                          PaymentMethod payMode = new PaymentMethod();
                          payMode.initPaymentGateway();

                          // if (widget.billing != null) {
                          //   BlocProvider.of<OrderBloc>(context, listen: false)
                          //     ..add(OrderItemAddEvent(
                          //         userId: widget.userId,
                          //         orderData: priceData['orderData'],
                          //         billing: widget.billing,
                          //         shipping: widget.shipping,
                          //         context: context));
                          //   setState(() {
                          //     bottomBtn = false;
                          //   });
                          // }
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
