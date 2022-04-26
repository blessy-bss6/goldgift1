import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Elements/baseAppbar.dart';
import 'package:shop/Elements/formfield.dart';
import 'package:shop/Screen/ProdList.dart';
import 'package:shop/utils/common.dart';
import '../Backend/Bloc/subCategory_Bloc.dart';
import '../utils/style.dart';
import 'CategoryScr.dart';

class SubCategoryScreen extends StatelessWidget {
  final String? parent, pageNum;

  SubCategoryScreen({Key? key, this.pageNum, this.parent}) : super(key: key);
  final TextEditingController? searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (BuildContext context) => SubCategoryBloc()
        ..add(FetchSubCategoryEvent(
            pageNum: pageNum.toString(), parent: parent.toString())),
      child: BlocConsumer<SubCategoryBloc, SubCategoryState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SubCategorySuccessState) {
              return state.data.length > 0
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBars(
                          title: 'SubCategory List',
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
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 1.9),
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                              ),
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                print(state.data[index]['src']);
                                return CategeoryGridProdList(
                                  // onTap: () => navigationPush(context, ProductShowScreen()),
                                  imageUrl: '${state.data[index]['src']}',
                                  title: '${state.data[index]['name']}',
                                  onTap: () => navigationPush(
                                      context, ProductSubCategoryScreen(categoryId:state.data[index]['id'].toString())),
                                );
                              }, childCount: state.data.length)),
                        ),
                      ],
                    )
                  : CustomScrollView(slivers: [
                      SliverAppBars(
                        title: 'SubCategory List',
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
                      SliverToBoxAdapter(child: Center(
                      child: Text("No data"),
                    ),)
                    ]);
            }
            // print(state);
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    ));
  }
}
