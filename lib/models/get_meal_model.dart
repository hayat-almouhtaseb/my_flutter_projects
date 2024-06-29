// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MenueModel {
  final String name;
  final String description;
  final List images;
  final int price;
  MenueModel({
    required this.name,
    required this.description,
    required this.images,
    required this.price,
  });

  MenueModel copyWith({
    String? name,
    String? description,
    List? images,
    int? price,
  }) {
    return MenueModel(
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'images': images,
      'price': price,
    };
  }

  factory MenueModel.fromMap(Map<String, dynamic> map) {
    return MenueModel(
      name: map['name'] as String,
      description: map['description'] as String,
      images: List.from(
        (map['images'] as List),
      ),
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenueModel.fromJson(String source) =>
      MenueModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MenueModel(name: $name, description: $description, images: $images, price: $price)';
  }

  @override
  bool operator ==(covariant MenueModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        listEquals(other.images, images) &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        images.hashCode ^
        price.hashCode;
  }
}
