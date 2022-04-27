import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

// class SharedHelper {
//   // late SharedPreferences prefs;
// //  final SharedPreferences prefs = await _prefs;
//   void setString(String key, String value) async {
//     final prefs = await SharedPreferences.getInstance();
//     // prefs = await SharedPreferences.getInstance();
//     await prefs.setString(key, value);
//   }

//   Future<String> getString(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     // prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key)!;
//   }

//   Future<bool> containsKey(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     // prefs = await SharedPreferences.getInstance();
//     return prefs.containsKey(key);
//   }

//   Future<bool> remove(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     // prefs = await SharedPreferences.getInstance();
//     return prefs.remove(key);
//   }

//   Future<bool> setStringList(String key, List<String> list) async {
//     final prefs = await SharedPreferences.getInstance();
//     // prefs = await SharedPreferences.getInstance();
//     return prefs.setStringList(key, list);
//   }

//   Future<List<String>> getStringList(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     // prefs = await SharedPreferences.getInstance();
//     return (prefs.getStringList(key) ?? <String>[]);
//   }
// }

// 1 Cart With Local DataBase

class ShopC {
  final shoppingBox = Hive.box('shopping_box');

  refreshItems() {
    final data = shoppingBox.keys.map((key) {
      final value = shoppingBox.get(key);
      return {
        "key": key,
        "id": value["id"],
        "name": value["name"],
        "quantity": value['quantity'],
        "Fixedsale_price": value["Fixedsale_price"],
        "Fixedregular_price": value["Fixedregular_price"],
        "sale_price": value["sale_price"],
        "regular_price": value["regular_price"]
      };
    }).toList();
    return data.reversed.toList();
  }

// Create new item
  Future<void> createItem(Map<String, dynamic> newItem) async {
    await shoppingBox.add(newItem);
  }

  Map<String, dynamic> readItem(int key) {
    final item = shoppingBox.get(key);
    return item;
  }

// Update a single item
  Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
    await shoppingBox.put(itemKey, item);
  }

// Delete a single item
  Future<void> deleteItem(int itemKey) async {
    await shoppingBox.delete(itemKey);
  }
}
