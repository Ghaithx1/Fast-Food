// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fast_food/feuters/orders_managment/data/model/food.dart';

class FoodWithQuantity {
  Food food;
  int quantity;
  FoodWithQuantity(this.food,this.quantity);

  FoodWithQuantity copyWith({
    Food? food,
    int? quantity,
  }) {
    return FoodWithQuantity(
      food ?? this.food,
      quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'food': food.toMap(),
      'quantity': quantity,
    };
  }

  factory FoodWithQuantity.fromMap(Map<String, dynamic> map) {
    return FoodWithQuantity(
      Food.fromMap(map['food'] as Map<String,dynamic>),
      map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodWithQuantity.fromJson(String source) => FoodWithQuantity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FoodWithQuantity(food: $food, quantity: $quantity)';

  @override
  bool operator ==(covariant FoodWithQuantity other) {
    if (identical(this, other)) return true;
  
    return 
      other.food == food &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => food.hashCode ^ quantity.hashCode;
}
