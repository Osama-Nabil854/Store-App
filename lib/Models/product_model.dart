class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final Ratings rate;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rate,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rate: Ratings.fromJson(json['rating'] ?? {'rate': 0, 'count': 0}),
    );
  }
}

class Ratings {
  final num rate;
  final num count;

  Ratings({
    required this.rate,
    required this.count,
  });
  factory Ratings.fromJson(dynamic json) {
    return Ratings(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
