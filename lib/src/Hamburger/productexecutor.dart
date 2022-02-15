import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import './hamburgers_list.dart';
import 'dart:io';
// import 'products_model.dart';
// import 'dart:convert';

// void main() {
//   runApp(MaterialApp(
//     home:HamburgersList(storage : ProductsExecutor()));

// }

class ProductsExecutor {
  //get directory
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print('directory: ' + directory.path);
    return directory.path;
  }

  //get file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/products.txt');
  }

  //reading file
  Future<String?> readProducts() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      print('contents: ' + contents);
      return contents;
    } catch (e) {
      return '';
    }
  }

  /**
   * Conversion
   */
  // Map<String, dynamic> jmap = jsonDecode(jsonstr);
  // JsonProducts = Products.fromJson(jmap);

  // Map<String, dynamic> afterconversion = jsx.toJson();

  // String all = jsonEncode(afterconversion);
  // print("after conversion, back to json" + all);
}
