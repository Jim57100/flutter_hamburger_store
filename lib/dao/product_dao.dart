import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:salice_flutter/Model/products.dart';
import 'dart:io';
import 'package:salice_flutter/dao/product_dao.dart';

class ProductDao {
  ///get directory
  static Future<String> get _directoryPath async {
    final directory = await getApplicationDocumentsDirectory();
    // ignore: avoid_print
    print('productsJson directory: ' + directory.path);
    return directory.path;
  }

  ///get file
  static Future<File> get _localFile async {
    final path = await _directoryPath;
    // ignore: avoid_print
    print('productJson path: ' + path);
    return File('$path/products.json');
  }

  //reading file
  static Future<ProductsModel?> readProducts() async {
    try {
      File file = await _localFile;
      final productsContent =
          (await file.readAsString()) as Map<String, dynamic>;
      return ProductsModel.fromJson(productsContent);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  // //writting file
  // static Future<File> writingProducts(String product, _localFile) async {
  //   final file = await _localFile;
  //   return file.writeAsString(product);
  // }

}
