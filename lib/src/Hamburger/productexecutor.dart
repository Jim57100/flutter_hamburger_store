import 'dart:convert';
import 'package:salice_flutter/src/Model/products_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../Model/products_model.dart';
// import 'dart:convert';

// void main() {
//   runApp(MaterialApp(
//     home:HamburgersList(storage : ProductsExecutor()));

// }

class ProductsExecutor {
  // //get directory
  // static Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   print('directory: ' + directory.path);
  //   return directory.path;
  // }

  // //get file
  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/products.txt');
  // }

  //reading file
  static Future<Object> readProducts() async {
    try {
      final file =
          await rootBundle.rootBundle.loadString('jsonfiles/products.json');
      final list = json.decode(file) as List<dynamic>;
      return list.map((data) => ProductsModel.fromJson(data)).toList();

      // final contents = await file.readAsString();
      // print('contents: ' + contents);
      // return contents;
    } catch (e) {
      return 'something went wrong while accessing json data products';
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
