import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../utils/style.dart';

import 'button.dart';

class ImgSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    List items = ['assets/imgs/ban1.png', 'assets/imgs/ban2.png'];
    return Container(
        child: CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, itemIndex, realIndex) {
        return Container(
            width: MediaQuery.of(context).size.width / 1.25,
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(),
            child: Pics(
              src: items[itemIndex],
              fit: BoxFit.cover,
              width: double.infinity,
            ));
      },
      options: CarouselOptions(
        height: 150,
        // aspectRatio: 16 / 9,
        // viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 200),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      // items: [1, 2, 3, 4, 5].map((i) {
      //   return Builder(
      //     builder: (BuildContext context) {
      //       return Container(
      //           width: MediaQuery.of(context).size.width / 1.25,
      //           margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      //           decoration: BoxDecoration(),
      //           child: Pics(
      //             src: 'assets/icons/banner-img.png',
      //             fit: BoxFit.cover,
      //             width: double.infinity,
      //           ));
      //     },
      //   );
      // }).toList(),
    ));
  }
}

// ! Common Image File

class Pics extends StatelessWidget {
  final String? src;
  final bool? networkImg;
  final BoxFit? fit;
  final double? height, width;
  final Color? color;

  const Pics(
      {Key? key,
      this.src,
      this.color,
      this.networkImg,
      this.fit,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //   height: double.infinity,
        // width: double.infinity,
        child: src != null ? imgs() : null);
  }

  Widget imgs() {
    if (networkImg == true) {
      return Image.network(
        src ?? '',
        fit: fit,
        height: height,
        width: width,
        color: color,
      );
    } else {
      return Image.asset(
        src ?? '',
        fit: fit,
        height: height,
        width: width,
        color: color,
      );
    }
  }
}

//  IMAGE HORIZONTAL LIST
class ImgHorizontalList extends StatelessWidget {
  final dynamic prodList;
  final dynamic callBack;
  final dynamic itemBorder;
  final dynamic btn;
  final double? cheight;
  const ImgHorizontalList(
      {Key? key,
      this.itemBorder,
      this.cheight,
      this.btn,
      this.prodList,
      this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      // color: Colors.red,
      height: cheight ?? 55,
      width: double.infinity,
      child: ListView.builder(
          itemCount: prodList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                callBack(prodList[i]);
                // print('pics ${prodList[i]}');
              },
              child: Column(
                children: [
                  Container(
                    decoration: prodList[i] == itemBorder
                        ? BoxDecoration(
                            border: Border.all(width: 1, color: Colors.green),
                            borderRadius: BorderRadius.circular(5))
                        : null,
                    child: Pics(
                      // margin: EdgeInsets.all(3),
                      src: '${prodList[i]}',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  // heightSizedBox(3.0),
                  Container(
                    child: btn != null
                        ? Btn(
                            padding: EdgeInsets.all(2),
                            color: redColor,
                            height: 20,
                            btnName: 'DELETE',
                            style: TextStyle(
                              color: txtWhiteColor,
                              fontSize: 12,
                            ))
                        : null,
                  )
                ],
              ),
            );
          }),
    );
  }
}
