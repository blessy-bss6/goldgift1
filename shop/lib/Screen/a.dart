import 'package:flutter/material.dart';
import 'package:shop/Backend/Resp/prod_home_Resp.dart';

class ProdScr extends StatelessWidget {
  ProdScr({Key? key}) : super(key: key);
  ProdHomeRespo prodresp = ProdHomeRespo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: prodresp.prodResp(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.data != null) {
            return Center(
              child: Text("Home Page"),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
