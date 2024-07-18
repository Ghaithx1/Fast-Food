// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
enum FoodType{
  yali,poca,ekmek,borek,coffe,market,sigara,all,
}

class Food {
  int? id;
  String name;
  double price;
  FoodType foodType;
  Food({this.id ,required this.foodType, required this.name,required this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'foodType': foodType.toString()
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      price: map['price'] as double,
      foodType: FoodType.values.firstWhere(
      (type) => type.toString() == map['foodType'],
      orElse: () => FoodType.market, // Default value if not found
    )
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Food(id: $id, name: $name, price: $price,foodType : ${foodType.name})';

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode;
}
