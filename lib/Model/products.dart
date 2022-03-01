class ProductsModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final bool isFavorite;

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

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'price': price,
        'isFavorite': isFavorite,
      };
}
