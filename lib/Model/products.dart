class ProductsModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite = false;

  //Constructor
  ProductsModel(this.id, this.name, this.description, this.imageUrl, this.price,
      this.isFavorite);

  ProductsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        imageUrl = json['imageUrl'],
        price = json['price'],
        isFavorite = json['isFavorite'];

  static List<ProductsModel> fromList(List<dynamic> jsonList) {
    List<ProductsModel> liste = [];

    for (var unObj in jsonList) {
      var p = ProductsModel.fromJson(unObj);
      liste.add(p);
      // ignore: avoid_print
      print(p);
    }
    return liste;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'price': price,
        'isFavorite': isFavorite,
      };
}
