class ProductsModel {
  int? id;
  String? name;
  String? description;
  int? price;

  //Constructor
  ProductsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }
}
