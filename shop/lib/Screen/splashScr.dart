import 'dart:async';
import 'package:flutter/material.dart';

import 'package:shop/Elements/imgScr.dart';

import 'package:shop/Screen/bottomNav.dart';
import 'package:shop/utils/common.dart';
import 'package:shop/utils/shared_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // SharedHelper sharedHelper = SharedHelper();

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    // bool isLogin = await sharedHelper.containsKey('current_user');
    // print('splash Login $isLogin');
    // if (isLogin) {
    //   // currentUser.value = await getCurrentUser();
    //   // print(currentUser.value.token);
    //   print('splash Login $isLogin');
    //   navigationRemoveUntil(
    //       context,
    //       UserNavigationBar(
    //         currentTab: 2,
    //       ));
    // } else {
    Timer(
        Duration(seconds: 2),
        () => navigationRemoveUntil(
            context,
            UserNavigationBar(
              currentTab: 0,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: double.infinity, width: double.infinity,
          child: Pics(
            src: 'assets/imgs/goldspalsh.jpg',
            fit: BoxFit.cover,
          ),
          // Text(
          //   'Gold Gift Ideas',
          //   style: labelTextStyle,
          // )
        ),
      ),
    );
  }
}
