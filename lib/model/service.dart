// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'package:http/http.dart' as http;
import 'dart:convert';


List<Product> productFromMap(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String productToMap(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    final int id;
    final String title;
    final double price;
    final String description;
    final String category;
    final String image;
    final Rating rating;

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromMap(json["rating"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toMap(),
    };
}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final double rate;
    final int count;

    factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "rate": rate,
        "count": count,
    };
}

Future<List<Product>> fetchProduct() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products?limit=5'),
  );

  if (response.statusCode == 200) {
    var parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed
        .map<Product>(
          (json) => Product.fromMap(json),
        )
        .toList();
  } else {
    throw Exception('Failed to load Product');
  }
}

Future<List<Product>> fetchShopProduct() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );

  if (response.statusCode == 200) {
    var parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed
        .map<Product>(
          (json) => Product.fromMap(json),
        )
        .toList();
  } else {
    throw Exception('Failed to load Product');
  }
}
