import 'dart:convert';

//many to many
class UserWithFood {
  int? id;
  String food_name;
  int quantity;
  int user_id;
  int food_id;
  UserWithFood({this.id ,required this.food_name, required this.food_id,required this.quantity,required this.user_id});

  UserWithFood copyWith({
    int? id,
    String? food_name,
    int? quantity,
    int? user_id,
    int? food_id,
  }) {
    return UserWithFood(
      id: id ?? this.id,
      food_name: food_name ?? this.food_name,
      quantity: quantity ?? this.quantity,
      user_id: user_id ?? this.user_id,
      food_id: food_id ?? this.food_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'food_name': food_name,
      'quantity': quantity,
      'user_id': user_id,
      'food_id': food_id,
    };
  }

  factory UserWithFood.fromMap(Map<String, dynamic> map) {
    return UserWithFood(
      id: map['id'] != null ? map['id'] as int : null,
      food_name: map['food_name'] as String,
      quantity: map['quantity'] as int,
      user_id: map['user_id'] as int,
      food_id: map['food_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserWithFood.fromJson(String source) => UserWithFood.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserWithFood(id: $id, food_name: $food_name, quantity: $quantity, user_id: $user_id, food_id: $food_id)';
  }

  @override
  bool operator ==(covariant UserWithFood other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.food_name == food_name &&
      other.quantity == quantity &&
      other.user_id == user_id &&
      other.food_id == food_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      food_name.hashCode ^
      quantity.hashCode ^
      user_id.hashCode ^
      food_id.hashCode;
  }
}
