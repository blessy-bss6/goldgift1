import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Screen/ProdList.dart';
import 'package:shop/utils/common.dart';
import 'CategoryScr.dart';

class SubCategoryScreen extends StatelessWidget {
  SubCategoryScreen({Key? key}) : super(key: key);
  final TextEditingController? searchController = TextEditingController();


  List catList = [
    {
      "pic": "assets/imgs/prodcat1.png",
      "name": "SILVER PLATED",
      "product": 245
    },
    {
      "pic": "assets/imgs/prodcat2.png",
      "name": "GERMAN SILVER",
      "product": 117
    },
    {"pic": "assets/imgs/prodcat3.png", "name": "COPPERWARE", "product": 36},
    {"pic": "assets/imgs/prodcat4.png", "name": "BRASS ITEMS", "product": 121},
    {"pic": "assets/imgs/prodcat5.png", "name": "POOJA MANDIR", "product": 25},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar
          // SliverAppBars(
          //   title: 'SubCategory List',
          // ),
          SliverAppBars(
            title: 'SubCategory List',
            bottomChild: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: SearchBox(
                  controller: searchController,
                ),
              ),
            ),
          ),

          // ! Category List
          SliverPadding(
            padding: const EdgeInsets.all(5.0),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.9),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CategeoryGridProdList(
                    // onTap: () => navigationPush(context, ProductShowScreen()),
                    imageUrl: '${catList[index]['pic']}',
                    title: '${catList[index]['name']}',
                    onTap: () => navigationPush(context, ProductListScreen()),
                  );
                }, childCount: catList.length)),
          ),
        ],
      ),
    );
  }
}
