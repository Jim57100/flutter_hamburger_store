class ProductsModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final int quantity;

  //Constructor
  ProductsModel(this.id, this.name, this.description, this.imageUrl, this.price,
      this.quantity);

  ProductsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        imageUrl = json['imageUrl'],
        price = json['price'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'price': price,
        'quantity': quantity
      };
}
