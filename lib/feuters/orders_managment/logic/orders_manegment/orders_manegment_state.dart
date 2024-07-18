import 'dart:core';

import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part'orders_manegment_state.freezed.dart';

@freezed
abstract class OrdersManegmentState with _$OrdersManegmentState {
  const factory OrdersManegmentState.initial() = _OrdersManegment;
  const factory OrdersManegmentState.Loading() = _Loading;
  const factory OrdersManegmentState.Loaded(User user,List<UserWithFood> foods,double money) = _Loaded;
  const factory OrdersManegmentState.Erorr(String) = _Erorr;
  const factory OrdersManegmentState.Empty() = _Empty;

}