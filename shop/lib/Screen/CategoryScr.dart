import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Screen/subCategoryScr.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
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
          SliverAppBars(
            title: 'Category List',
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
                    onTap: () => navigationPush(context, SubCategoryScreen()),
                  );
                }, childCount: catList.length)),
          ),
        ],
      ),
    );
  }
}

// ! Category ProdList
class CategeoryGridProdList extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  final dynamic onTap;
  final bool? fromSubProducts;
  const CategeoryGridProdList(
      {Key? key,
      this.title,
      this.imageUrl,
      this.onTap,
      this.fromSubProducts = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // padding: EdgeInsets.only(top: 3),
          decoration: BoxDecoration(
              color: offWhiteColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Color.fromARGB(255, 236, 234, 234),
              )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    imageUrl!,
                    width: 150,
                    height: 100,
                    // padding: EdgeInsets.all(2),
                  ),
                ),
                Divider(),
                // ! title  and Subtitle for
                Container(
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 2),
                  child: Text(
                    title!.length <= 40 ? title! : title!.substring(0, 40),
                    textAlign: TextAlign.left,
                    // fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ));
  }
}
