import 'package:flutter/material.dart';
import '../Elements/button.dart';
import '../Elements/imgScr.dart';
import '../common/order_cart_item.dart';
import '../common/dialogBoxS.dart';
import '../utils/style.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: offWhiteColor,
                    border: Border.all(
                      color: borderColor,
                    )
                    // border: Border(
                    //     bottom: BorderSide(
                    //         width: 1.0,
                    //         color: Color.fromARGB(255, 221, 214, 214)))
                    ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#Order Id: 8888888',
                        style: labelTextStyle,
                      ),
                      Divider(),
                      TrackingProdContent()
                    ]));
          }),
    );
  }
}

class TrackingProdContent extends StatefulWidget {
  TrackingProdContent({Key? key}) : super(key: key);

  @override
  State<TrackingProdContent> createState() => _TrackingProdContentState();
}

class _TrackingProdContentState extends State<TrackingProdContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipped',
            style: labelTextStyle,
          ),

          TrackDetContent(
            value: 0.75,
          ),
          Divider(),
          // ! Product Deatils
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Pics(
                    src: 'assets/images/indianGod.png',
                    width: 80,
                    height: 50,
                  ),
                  BasicProdDetail(
                    cartBtn: false,
                    mrpTxt: false,
                  ),
                ],
              ),
              InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    alignment: Alignment.topRight,
                    child: Txt(
                      t: 'Cancel',
                      color: redColor,
                    ),
                  ))
            ],
          ),
          // Divider(),
          // !  Button For View More
          Center(
            child: Btn(
              margin: EdgeInsets.only(bottom: 5),
              width: 120,
              btnName: 'view more',
              txtColor: txtWhiteColor,
              color: coffeColor,
              height: 30,
              onTap: () async {
                await showDialog(
                  context: context,
                  // barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertBox(
                      title: 'Order Details',
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PriceList(
                            heading: 'Price',
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// ! Traicking page
class TrackDetContent extends StatelessWidget {
  final double? value;
  final int? trackId;
  final String? t;
  final dynamic onTap;
  AlignmentGeometry? alignment;
  final Color? txtColor, indColor;

  TrackDetContent(
      {Key? key,
      this.onTap,
      this.txtColor,
      this.indColor,
      this.alignment,
      this.value,
      this.t,
      this.trackId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // statsTxt(),
          Container(
            alignment: value == 1.0
                ? Alignment.topRight
                : value == .25
                    ? Alignment(-0.7, .5)
                    : value == .50
                        ? Alignment.center
                        : value == .75
                            ? Alignment(0.7, .5)
                            : Alignment.topLeft,
            child: Txt(
              t: t ?? 'Accept',
              color: value == 1.0
                  ? redColor
                  : value == .25
                      ? txtBlackColor
                      : value == .50
                          ? textBlueColor
                          : value == .75
                              ? Colors.brown
                              : offgreenColor,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            // width: 90,
            child: LinearProgressIndicator(
              minHeight: 5,
              color: indColor ?? offgreenColor,
              backgroundColor: Colors.black12,
              // valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
              value: value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Txt(
                  t: ' Delivery \n Tracking Id ${trackId}',
                  color: txtBlackColor,
                  fontSize: 13,
                ),
                InkWell(
                  onTap: onTap ??
                      () {
                        print('btn');
                      },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: txtBlackColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: Txt(
                      t: ' TrackOrder ',
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget statsTxt() {
    return Container(
      alignment: value == 1.0
          ? Alignment.topRight
          : value == .25
              ? Alignment.centerLeft
              : value == .50
                  ? Alignment.center
                  : value == .75
                      ? Alignment.centerRight
                      : Alignment.topLeft,
      child: Txt(
        t: t ?? 'Accept',
        color: offgreenColor,
      ),
    );
  }
}
