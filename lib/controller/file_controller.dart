import 'package:get/get.dart';
import 'package:salice_flutter/dao/cart_dao.dart';
import 'package:salice_flutter/dao/product_dao.dart';

class FileController extends GetxController {
  readProducts() async {
    final result = await ProductDao.readProducts();

    // if (result.isEmpty) {
    //   product = ProductsModel.fromJson(await ProductDao.readProducts());
    // }
    return result;
  }

  readCart() async {
    final result = await CartDao.readCart();

    // if (result != null) {
    //   _cart = CartModel.fromJson(await CartDao.readCart());
    // }

    return result;
  }

  // writeCart() async {
  //   final cart = await CartDao.writeCart();

  //   return cart;
  // }
}
