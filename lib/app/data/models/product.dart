

class Product {
  int? id;
  String? title;
  String? description;
  int? price;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        id: data['id'] as int?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        price: data['price'] as int?,
        stock: data['stock'] as int?,
        brand: data['brand'] as String?,
        category: data['category'] as String?,
        thumbnail: data['thumbnail'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'stock': stock,
        'brand': brand,
        'category': category,
        'thumbnail': thumbnail,
      };
}
