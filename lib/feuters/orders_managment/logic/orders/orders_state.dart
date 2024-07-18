import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_state.freezed.dart';

@freezed
abstract class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.getFoodsList(List<Food> foodList,FoodType foodType) = _getFoodsList;
  const factory OrdersState.addressLoadSuccess() = _addressLoadSuccess;
}
