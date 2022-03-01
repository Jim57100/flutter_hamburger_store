import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salice_flutter/Model/products.dart';
import 'dart:io';
import 'package:flutter/services.dart' as root_bundle;

class ProductDao {
  static final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('products');

  ///Get Firestore data
  static Future<List<Object?>> getData(_collectionReference) async {
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

    if (directory.path == null) {
      print(directory.path);
      writeProducts(getData(_collectionReference));
      return directory.path;
    } else {
      return directory.path;
    }
  }

  ///get file
  static Future<File> get _localFile async {
    final path = await _localPath;
    // ignore: avoid_print
    print('productJson path: ' + path);
    return File('$path/products.json');
  }

  //Write first file
  static Future<File> writeProducts(data) async {
    print('local file ok !');
    final file = await _localFile;
    return file.writeAsString(json.encode(data.toJson()));
  }

  //write file with isFavorite
  static Future<File> writeFavorite(
      int index, bool isFavorite, _localFile) async {
    final file = await _localFile;
    return file.writeAsString(json.encode(isFavorite));
  }

  //reading file
  static Future<ProductsModel?> readProducts() async {
    // try {
    File file = await _localFile;
    final productsContent = (await file.readAsString()) as Map<String, dynamic>;
    return ProductsModel.fromJson(productsContent);
    // } catch (e) {
    //   // ignore: avoid_print
    //   print(e);
    // }
    return null;
  }
}
