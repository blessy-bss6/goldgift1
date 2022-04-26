import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/button.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Screen/subCategoryScr.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/style.dart';

import '../Backend/Bloc/category_Bloc.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController? searchController = TextEditingController();

  // List catList = [
  dynamic pageNum = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) =>
            CategoryBloc()..add(FetchCategoryEvent()),
        child: BlocConsumer<CategoryBloc, CategoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              // print(state);
              if (state is CategorySuccessState) {
                return state.data.length > 0
                    ? CustomScrollView(
                        slivers: [
                          // ! Sliver app Bar
                          SliverAppBars(
                            title: 'Category List',
                            bottomChild: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.9),
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return CategeoryGridProdList(
                                    imageUrl: null,

                                    // imageUrl: state.data[index]['image']['src'] ??null,
                                    title: '${state.data[index]['name']}',
                                    onTap: () => navigationPush(
                                        context, SubCategoryScreen(pageNum: pageNum.toString(), parent: state.data[index]['parent'].toString(),)),
                                  );
                                }, childCount: state.data.length)),
                          ),

                          SliverToBoxAdapter(
                            child: Row(
                              children: [
                              Expanded(
                                  child: Center(
                                    child: Btn(
                                height: 40,
                                btnName: 'LoadMore',
                                color: darkBlueColor,
                                onTap: () {
                                    setState(() {
                                      pageNum = pageNum + 1;
                                    });
                                    BlocProvider.of<CategoryBloc>(context,
                                        listen: false)
                                      ..add(FetchCategoryEvent(
                                          pageNum: pageNum.toString()));
                                },
                              ),
                                  )),
                              

                              Expanded(
                                      child: Container(
                                        child:  pageNum > 1
                                      ? Btn(
                                        height: 40,
                                        btnName: 'Previous',
                                        color: darkBlueColor,
                                        onTap: () {
                                          setState(() {
                                            pageNum = pageNum - 1;
                                          });
                                          BlocProvider.of<CategoryBloc>(
                                              context,
                                              listen: false)
                                            ..add(FetchCategoryEvent(
                                                pageNum: pageNum.toString()));
                                        },
                                    ):null
                                      )),
                            ]),
                          )
                        ],
                      )
                    : Center(
                        child: Text("No Data"),
                      );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }),
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
                  child: Container(
                      child: imageUrl != null
                          ? Image.network(
                              imageUrl!,
                              width: 150,
                              height: 100,
                              // padding: EdgeInsets.all(2),
                            )
                          : null),
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
