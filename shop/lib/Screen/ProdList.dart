import 'package:flutter/material.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Screen/ProdDetails.dart';
import 'package:shop/utils/common.dart';

import 'CategoryScr.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);

  final List<Widget> tabs = [];

  // dynamic Order;

  // dynamic OrderItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar

          SliverAppBars(
            title: 'Product List',
          ),

          //  ! Sliver Product Content

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
                    imageUrl: 'assets/images/Wooden-Pooja-Mandir.png',
                    title: 'ProductList',
                    onTap: () => navigationPush(context, ProdDetailScreen()),
                  );
                }, childCount: 5)),
          ),
        ],
      ),
    );
  }
}
