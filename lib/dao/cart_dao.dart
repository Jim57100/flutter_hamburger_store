// import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:salice_flutter/Model/cart_model.dart';

abstract class CartDao {
  //get directory
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //get file
  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/cart.json');
  }

  //write file
  static Future<File> writeCart(CartModel cart) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(json.encode(cart.toJson()));
  }

  //reading file
  static Future<CartModel?> readCart() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();

      return CartModel.fromJson(contents);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

//   ///Conversion
//   Map<String, dynamic> jmap = jsonDecode(jsonstr);
//   JsonProducts = Products.fromJson(jmap);

//   Map<String, dynamic> afterconversion = jsx.toJson();

//   String all = jsonEncode(afterconversion);
//   print("after conversion, back to json" + all);
}
