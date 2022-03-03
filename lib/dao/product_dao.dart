import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salice_flutter/Model/products.dart';
import 'dart:io';

class ProductDao {
  static final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('products');

  ///Get Firestore data
  static Future<List<Object?>> getData() async {
    /// Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionReference.get();
    // ignore: avoid_print
    print('querySnapshot:' + querySnapshot.toString());

    /// Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }

  ///get directory
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  ///get file
  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/products.json');
  }

  //Write first file
  static Future<File> writeProducts(data) async {
    // ignore: avoid_print
    print('local file ok !');
    final file = await _localFile;
    return file.writeAsString(json.encode(data));
  }

  //reading file
  static Future<List<ProductsModel>?> readProducts() async {
    try {
      File file = await _localFile;
      final productsContent = (await file.readAsString());
      // ignore: avoid_print
      print("j'en lit " + jsonDecode(productsContent).length.toString());
      return ProductsModel.fromList(jsonDecode(productsContent));
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }
}
