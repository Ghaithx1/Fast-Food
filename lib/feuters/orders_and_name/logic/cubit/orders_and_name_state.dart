
import 'package:fast_food/feuters/orders_and_name/data/model/user_and_foods.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_and_name_state.freezed.dart';

@freezed
class OrdersAndNameState with _$OrdersAndNameState {
  const factory OrdersAndNameState.initial() = _Initial;
  const factory OrdersAndNameState.loaded(List<UserAndFoods> foods) = _loaded;
}
