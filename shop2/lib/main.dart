import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'package:provider/provider.dart';

import 'Allproveder.dart';
import 'Screen/splashScr.dart';

import 'package:wp_json_api/wp_json_api.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('shopping_box');


  runApp( MyApp());
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

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String? _deviceId;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String? deviceId;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       deviceId = await PlatformDeviceId.getDeviceId;
//     } catch(e) {
//       deviceId = 'Failed to get deviceId.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _deviceId = deviceId;
//       print("deviceId->$_deviceId");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Text('Device ID : $_deviceId'),
//         ),
//       ),
//     );
//   }
// }
