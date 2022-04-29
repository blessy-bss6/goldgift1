import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Backend/Bloc/prod_Bloc.dart';
import '../Elements/baseAppbar.dart';
import '../Elements/button.dart';
import '../Elements/imgScr.dart';
import '../utils/common.dart';
import '../utils/style.dart';

import '../Backend/Bloc/localCart_Bloc.dart';
import '../utils/htmlRemove.dart';
import 'cartScr.dart';

class ProdDetailScreen extends StatefulWidget {
  final dynamic prodNumber;
  ProdDetailScreen({Key? key, this.prodNumber}) : super(key: key);

  @override
  State<ProdDetailScreen> createState() => _ProdDetailScreenState();
}

class _ProdDetailScreenState extends State<ProdDetailScreen> {
  // final List img = [
  //   'assets/images/IndianGod.png',
  //   'assets/images/god-idols.png',
  //   // // 'assets/images/snacks.png',
  //   'assets/images/Brass.png',
  //   // 'assets/images/pulse.png',
  //   // 'assets/images/watermelon.png',
  // ];

  // dynamic listImgSrc;

  // imgcallBack(dynamic imgSrc) {
  //   // print('callBack $imgSrc');
  //   setState(() {
  //     listImgSrc = imgSrc;
  //   });
  // }

  dynamic description;
  @override
  void initState() {
    // TODO: implement initState
    description = HtmlTags.removeTag(
        htmlString: widget.prodNumber['description'],
        callBack: (string) => print(string));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Product Details',
        centerTitle: true,
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // ! Image Section
                  Container(
                    alignment: Alignment.center,
                    // color: Colors.red,
                    child: Pics(
                      src: 'assets/images/Wooden-Pooja-Mandir.png',
                      width: 300,
                      height: 200,
                    ),
                  ),
                  heightSizedBox(5.0),
                  //  Image List Section
                  // ImgHorizontalList(
                  //   cheight: 80,
                  //   prodList: img,
                  //   callBack: imgcallBack,
                  //   itemBorder:
                  //       listImgSrc != null ? listImgSrc.toString() : null,
                  // ),
                  // !  Product Content
                  ProdDetailsContent(prodNumber: widget.prodNumber),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Txt(
                        t: description.toString(),
                        style: smallTextStyle,
                      ),
                    ),
                  )

                  // ! Btn  for Cart
                ],
              ),
            );
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          onTap: () {
            BlocProvider.of<LocalCartBloc>(context, listen: false)
              ..add(LocalCartItemAddEvent(prodData: {
                "id": widget.prodNumber['id'],
                "name": widget.prodNumber['name'],
                "quantity": 1,
                "Fixedsale_price": int.parse(widget.prodNumber["sale_price"]),
                "Fixedregular_price":
                    int.parse(widget.prodNumber["regular_price"]),
                "sale_price": int.parse(widget.prodNumber["sale_price"]),
                "regular_price": int.parse(widget.prodNumber["regular_price"])
              }));
            navigationPush(context, CartScreen());
          },
          alignment: Alignment.bottomLeft,
          height: 45,
          width: double.infinity,
          btnName: 'Add to Cart',
          txtColor: offWhiteColor,
          color: coffeColor,
        ),
      ),
    );
  }
}

class ProdDetailsContent extends StatefulWidget {
  final dynamic prodNumber;
  const ProdDetailsContent({Key? key, this.prodNumber}) : super(key: key);

  @override
  State<ProdDetailsContent> createState() => _ProdDetailsContentState();
}

class _ProdDetailsContentState extends State<ProdDetailsContent> {
  dynamic price;
  dynamic quantity;
  dynamic fullPrice;

  // plusCallBack(dynamic cartItem) {
  //   setState(() {
  //     price = cartItem * 150;
  //     quantity = cartItem;
  //     fullPrice = cartItem * 300;
  //     // print(' plus $cartItem');
  //   });
  // }

  // minusCallBack(dynamic cartItem) {
  //   setState(() {
  //     // print('minus $cartItem');
  //     price = cartItem * 150;
  //     quantity = cartItem;
  //     fullPrice = cartItem * 300;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [lineLeft(), lineRight()],
          ),
        ],
      ),
    );
  }

  Widget lineLeft() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! Title
        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          // alignment: Alignment.topLeft,
          child: Txt(
            // t: widget.prodNumber['name'],
            t: '${widget.prodNumber['name'].toString().length > 10 ? widget.prodNumber['name'].toString().substring(0, 50) + "\n" + widget.prodNumber['name'].toString().substring(50, 90) : widget.prodNumber['name']}',
            fontSize: 15,
            style: labelTextStyle,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          alignment: Alignment.topLeft,
          child: Txt(
            // textAlign: TextAlign.left,
            t: '${quantity != null ? quantity : 1} KG',
            fontSize: 20,
            color: greyColor,
          ),
        ),

        // Container(
        //   margin: EdgeInsets.only(top: 5, left: 10),
        //   child: CartBtn(
        //     plusCallBack: plusCallBack,
        //     minusCallBack: minusCallBack,
        //   ),
        // ),
      ],
    );
  }

  Widget lineRight() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 8.0),
      child: Column(
        children: [
          Txt(
            t: 'MRP : Rs${widget.prodNumber["regular_price"]}',
            decoration: TextDecoration.lineThrough,
            fontSize: 13,
            color: greyColor,
          ),
          Txt(
            t: 'Rs ${widget.prodNumber["sale_price"]}',
            fontSize: 17,
            color: offgreenColor,
          ),
        ],
      ),
    );
  }
}
