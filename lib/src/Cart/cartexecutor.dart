import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../../../src/Hamburger/hamburgers_list.dart';
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
    return File('$path/cart.txt');
  }

  //write file
  Future<File> writeCart(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  //reading file
  Future<String?> readCart() async {
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
