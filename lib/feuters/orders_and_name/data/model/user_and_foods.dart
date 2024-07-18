// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';

class UserAndFoods {
  String userName;
  double doubt;
  List<UserWithFood> foods = [];
  UserAndFoods({
    required this.userName,
    required this.doubt,
    required this.foods,
  });

  UserAndFoods copyWith({
    String? userName,
    double? doubt,
    List<UserWithFood>? foods,
  }) {
    return UserAndFoods(
      userName: userName ?? this.userName,
      doubt: doubt ?? this.doubt,
      foods: foods ?? this.foods,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'doubt': doubt,
      'foods': foods.map((x) => x.toMap()).toList(),
    };
  }

  factory UserAndFoods.fromMap(Map<String, dynamic> map) {
    return UserAndFoods(
      userName: map['userName'] as String,
      doubt: map['doubt'] as double,
      foods: List<UserWithFood>.from((map['foods'] as List<int>).map<UserWithFood>((x) => UserWithFood.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAndFoods.fromJson(String source) => UserAndFoods.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserAndFoods(userName: $userName, doubt: $doubt, foods: $foods)';

  @override
  bool operator ==(covariant UserAndFoods other) {
    if (identical(this, other)) return true;
  
    return 
      other.userName == userName &&
      other.doubt == doubt &&
      listEquals(other.foods, foods);
  }

  @override
  int get hashCode => userName.hashCode ^ doubt.hashCode ^ foods.hashCode;
  }
