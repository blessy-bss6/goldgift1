import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  // late SharedPreferences prefs;
//  final SharedPreferences prefs = await _prefs;
  void setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs = await SharedPreferences.getInstance();
    return prefs.getString(key)!;
  }

  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<bool> setStringList(String key, List<String> list) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, list);
  }

  Future<List<String>> getStringList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(key) ?? <String>[]);
  }
}

// class HiveHelpers {
//   final _shoppingBox = Hive.box('shopping_box');
//   // Create new item
//   Future<void> createItem(Map<String, dynamic> newItem) async {
//     await _shoppingBox.add(newItem);
//     // _refreshItems(); // update the UI
//   }

//   // Retrieve a single item from the database by using its key
//   // Our app won't use this function but I put it here for your reference
//   Map<String, dynamic> readItem(int key) {
//     final item = _shoppingBox.get(key);
//     return item;
//   }

//   // Update a single item
//   Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
//     await _shoppingBox.put(itemKey, item);
//     // _refreshItems(); // Update the UI
//   }

//   // Delete a single item
//   Future<void> deleteItem(int itemKey) async {
//     await _shoppingBox.delete(itemKey);
//     // _refreshItems(); // update the UI

//     // Display a snackbar
//   }
// }
