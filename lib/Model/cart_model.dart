import 'dart:convert';

class CartModel {
  int? _id;
  String? _name;
  int? _price;
  int? _quantity;
  int? _total;

  CartModel(this._id, this._name, this._price, this._total);

  CartModel.fromJson(String jsonString)
      : _id = 0,
        _name = '',
        _price = 0,
        _quantity = 0,
        _total = 0 {
    Map<String, dynamic> jsonObject = json.decode(jsonString);

    id = jsonObject['id'];
    name = jsonObject['name'];
    price = jsonObject['price'];
    quantity = jsonObject['quantity'];
    total = jsonObject['total'];
  }

  set id(int value) {
    _id = value + 1;
  }

  set name(String value) {
    _name = value;
  }

  set price(int value) {
    _price = value;
  }

  set quantity(int value) {
    _quantity = value;
  }

  set total(int value) {
    _total = value;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> resBody = {};
    resBody["id"] = _id;
    resBody["name"] = _name;
    resBody["price"] = _price;
    resBody["quantity"] = _quantity;
    resBody["total"] = _total;
    return resBody;
  }
}
