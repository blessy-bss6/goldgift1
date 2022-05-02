// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

// wp  .WordPress wordPress;

// // adminName and adminKey is needed only for admin level APIs
// wordPress = wp.WordPress(
//   baseUrl: 'http://localhost',
//   authenticator: wp.WordPressAuthenticator.JWT,
//   adminName: '',
//   adminKey: '',
// );

// Future<wp.User> response = wordPress.authenticateUser(
//   username: 'ChiefEditor',
//   password: 'chiefeditor@123',
// );

// response.then((user) {
//   createPost(user);
// }).catchError((err) {
//   print('Failed to fetch user: $err');
// });


import 'package:wp_json_api/models/responses/wp_user_login_response.dart';
import 'package:wp_json_api/wp_json_api.dart';

class WordP {
 Future<dynamic> data() async{
   
 }

}
