// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fast_food/feuters/orders_and_market/widgets/food_market.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';

class FoodMarket
 {
  int? id;
  String food_name;
  int quantity;
  double food_price;
  String food_type;
  FoodMarket({
    this.id,
    required this.food_name,
    required this.quantity,
    required this.food_price,
    required this.food_type,
  });
  

  FoodMarket copyWith({
    int? id,
    String? food_name,
    int? quantity,
    double? food_price,
    String? food_type,
  }) {
    return FoodMarket(
      id: id ?? this.id,
      food_name: food_name ?? this.food_name,
      quantity: quantity ?? this.quantity,
      food_price: food_price ?? this.food_price,
      food_type: food_type ?? this.food_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'food_name': food_name,
      'quantity': quantity,
      'food_price': food_price,
      'food_type': food_type,
    };
  }

  factory FoodMarket.fromMap(Map<String, dynamic> map) {
    return FoodMarket(
      id: map['id'] != null ? map['id'] as int : null,
      food_name: map['food_name'] as String,
      quantity: map['quantity'] as int,
      food_price: map['food_price'] as double,
      food_type: map['food_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodMarket.fromJson(String source) => FoodMarket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodMarket(id: $id, food_name: $food_name, quantity: $quantity, food_price: $food_price, food_type: $food_type)';
  }

  @override
  bool operator ==(covariant FoodMarket other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.food_name == food_name &&
      other.quantity == quantity &&
      other.food_price == food_price &&
      other.food_type == food_type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      food_name.hashCode ^
      quantity.hashCode ^
      food_price.hashCode ^
      food_type.hashCode;
  }
}
