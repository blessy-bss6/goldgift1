import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Backend/Bloc/prod_Bloc.dart';
import 'package:shop/Backend/Bloc/reg_Login_Bloc.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/drawers.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Elements/imgScr.dart';
import 'package:shop/Screen/cartScr.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import '../Backend/Bloc/home_Bloc.dart';
import 'CategoryScr.dart';
import 'LoginScr.dart';
import 'f1.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc prodBloc = HomeBloc();

  @override
  void initState() {
    prodBloc = BlocProvider.of<HomeBloc>(context, listen: false);
    prodBloc.add(FetchHomeEvent());
    super.initState();
  }

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
      body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            print(state);
            if (state is HomeSuccessState) {
              return CustomScrollView(
                slivers: [
                  // ! Sliver app Bar
                  SliverAppBar(
                    // expandedHeight: 6.0,
                    // flexibleSpace: const FlexibleSpaceBar(
                    //   title: Text('Available seats'),
                    // ),
                    backgroundColor: coffeColor,
                    title: Text(
                      'Gold Gift Ideas',
                      style: whiteTextStyle,
                    ),
                    centerTitle: true,
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(60),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            child: SearchBox(
                              controller: searchController,
                            ),
                          ),
                        )),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.login),
                        tooltip: 'Login',
                        onPressed: () => navigationPush(context, LoginScreen()),
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_bag),
                        tooltip: 'Cart',
                        onPressed: () => navigationPush(context, CartScreen()),
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      ImgSlider(),
                      CategoryListItem(cateList: state.category)
                    ]),
                  ),

                  // ! First List
                  SliverPadding(
                    padding: const EdgeInsets.all(2),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Divider(),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Special Offers ',
                                style: labelTextStyle,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(4.0),
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
                            imageUrl: catList[index]['pic'],
                            title: catList[index]['name'],
                          );
                        }, childCount: catList.length)),
                  ),

                  // ! First List
                  SliverPadding(
                    padding: const EdgeInsets.all(3),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Divider(),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'For Return Gift',
                                style: labelTextStyle,
                              )),
                        ],
                      ),
                    ),
                  ),
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
                            imageUrl: 'assets/images/Oxidized.png',
                            title: 'product',
                          );
                        }, childCount: 6)),
                  )
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      drawer: DrawerScreen(),
    );
  }
}

// !  Vertical list for Category
class CategoryListItem extends StatelessWidget {
  final dynamic cateList;
  List catList = [
    {
      "pic": "assets/imgs/prodcat1.png",
      "name": "INDIAN GOD IDOLS",
      "product": 245
    },
    {
      "pic": "assets/imgs/prodcat2.png",
      "name": "OXIDIZED FIGURINE",
      "product": 117
    },
    {
      "pic": "assets/imgs/prodcat3.png",
      "name": "COPPERWARE GIFT ITEMS",
      "product": 36
    },
    {
      "pic": "assets/imgs/prodcat4.png",
      "name": "BRASS GIFT ITEMS",
      "product": 121
    },
    {
      "pic": "assets/imgs/prodcat5.png",
      "name": "WOODEN POJJA MANDIR",
      "product": 25
    },
    {
      "pic": "assets/imgs/prodcat6.png",
      "name": "SILVER PLATED BOWL SET",
      "product": 151
    },
  ];

  CategoryListItem({Key? key, this.cateList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('catelist data $cateList');
     print(cateList.runtimeType);
     print(cateList.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ! Title Value
              Text(
                'Shop By Category',
                style: labelTextStyle,
              ),

              Btn(
                padding: EdgeInsets.only(left: 6, right: 6),
                height: 30,
                btnName: 'VIEW ALL',
                style: TextStyle(fontSize: 13, color: blackColor),
                color: Color.fromARGB(246, 200, 200, 214),
                onTap: () => navigationPush(context, CategoryScreen()),
              ),
            ],
          ),
        ),
        Container(
          height: 180,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: cateList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 8, right: 8, bottom: 3),
                child: InkWell(
                  onTap: () => navigationPush(context, CategoryScreen()),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ! Pic Section
                      Container(
                        child: Pics(networkImg: true,
                          src: cateList[i]['src'].toString(),
                          height: 120,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      heightSizedBox(1.0),
                      // ! Bottom Name
                      Container(
                        margin: EdgeInsets.only(top: 0.0),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          ' ${cateList[i]['name']}',
                          style: mediumTextStyle,
                        ),
                      ),
                      // ! Bottom Name
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '${cateList[i]['count']} product',
                          style: smallTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Product GridList
