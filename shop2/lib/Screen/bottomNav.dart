import 'package:flutter/material.dart';
import '../utils/style.dart';

import 'OrderDetScr.dart';
import 'cartScr.dart';
import 'CategoryScr.dart';
import 'HomeScr.dart';
import 'ProdList.dart';
import 'ProfileScr.dart';
import 'subCategoryScr.dart';

class UserNavigationBar extends StatefulWidget {
  final int? sellerId;
  int? currentTab;
  Widget? currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserNavigationBar({Key? key, this.currentTab, this.sellerId}) {
    if (currentTab == null) currentTab = 0;
  }
  @override
  _UserNavigationBarState createState() => _UserNavigationBarState();
}

class _UserNavigationBarState extends State<UserNavigationBar> {
  @override
  initState() {
    super.initState();
    _selectTab(widget.currentTab!);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = HomeScreen(
              // sellerId: widget.sellerId,
              );
          break;
        case 1:
          widget.currentPage = CategoryScreen(
              // sellerId: widget.sellerId,
              );
          break;

        case 2:
          widget.currentPage = ProductListScreen(
              // sellerId: widget.sellerId,
              );
          break;
        case 3:
          widget.currentPage = OrderDeatilsScreen(
              // sellerId: widget.sellerId,
              );
          break;

        case 4:
          widget.currentPage = CartScreen();

          break;
        case 5:
          widget.currentPage = ProfileScreen();
          // widget.currentPage = SelGeneratePromoCodes(sellerId: widget.sellerId);
          break;
        // case 5:
        //   widget.currentPage = Profile();
        //   break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      body: widget.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: coffeColor,
        // selectedFontSize: 0,
        // unselectedFontSize: 0,
        unselectedItemColor: Colors.black38,
        iconSize: 25,
        backgroundColor: offWhiteColor,
        currentIndex: widget.currentTab!,
        showSelectedLabels: true,
        selectedFontSize: 12,

        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            fontSize: 12, color: coffeColor, fontFamily: montserratMedium),

        unselectedLabelStyle: TextStyle(
            fontSize: 12, color: Colors.black38, fontFamily: montserratMedium),
        unselectedFontSize: 12,

        onTap: (int i) {
          this._selectTab(i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bottom-5.png',
              height: 22,
              color: widget.currentTab == 0 ? coffeColor : Colors.black38,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bottom-2.png',
              height: 22,
              color: widget.currentTab == 1 ? coffeColor : Colors.black38,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              size: 22,
              color: widget.currentTab == 2 ? coffeColor : Colors.black38,
            ),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              size: 22,
              color: widget.currentTab == 3 ? coffeColor : Colors.black38,
            ),
            // icon: Image.asset(
            //   'assets/icons/bottom-3.png',
            //   height: 22,
            //   color: widget.currentTab == 2 ? coffeColor : Colors.black38,
            // ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bottom-4.png',
              height: 22,
              color: widget.currentTab == 4 ? coffeColor : Colors.black38,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bottom-1.png',
              height: 22,
              color: widget.currentTab == 5 ? coffeColor : Colors.black38,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
