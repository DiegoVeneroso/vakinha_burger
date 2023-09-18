import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  int id;
  String name;
  String description;
  double price;
  String image;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'description': description,
  //     'price': price,
  //     'image': image,
  //   };
  // }

  // factory ProductModel.fromMap(Map<String, dynamic> map) {
  //   return ProductModel(
  //     id: map['id']?.toInt() ?? 0,
  //     name: map['name'] ?? '',
  //     description: map['description'] ?? '',
  //     price: map['price']?.toDouble() ?? 0.0,
  //     image: map['image'] ?? '',
  //   );
  // }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      };

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
      );
  // factory ProductModel.fromJson(String source) =>
  //     ProductModel.fromMap(json.decode(source));
}
