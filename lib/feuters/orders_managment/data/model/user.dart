// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  String name;
  double? doubt;
  bool taken;
  double money;
  User({
    this.id,
    required this.name,
    this.doubt,
    required this.taken,
    required this.money,
  });

  User copyWith({
    int? id,
    String? name,
    double? doubt,
    bool? taken,
    double? money,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      doubt: doubt ?? this.doubt,
      taken: taken ?? this.taken,
      money: money ?? this.money,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'doubt': doubt,
      'taken': taken,
      'money': money,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      doubt: map['doubt'] != null ? map['doubt'] as double : null,
      taken: map['taken'] == 1 || map['taken'] == 0,
      money: map['money'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, doubt: $doubt, taken: $taken, money: $money)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.doubt == doubt &&
      other.taken == taken &&
      other.money == money;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      doubt.hashCode ^
      taken.hashCode ^
      money.hashCode;
  }
}
