import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';

import 'Allproveder.dart';
import 'Screen/splashScr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('shopping_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MainBloc.allBlocs(),
      child: MaterialApp(
        title: 'GoldGiftIdeas',
        theme: ThemeData(
            // primaryColor: redColor,
            // appBarTheme: const AppBarTheme(color: redColor)
            ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home:ProdScr()
      ),
    );
  }
}
