import 'package:fast_food/feuters/orders_and_market/data/model/food_market.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_and_market_state.freezed.dart';

@freezed
abstract class OrdersAndMarketState with _$OrdersAndMarketState {
  const factory OrdersAndMarketState.initial() = _Initial;
  const factory OrdersAndMarketState.loaded(List<FoodMarket> foods,double money,FoodType currentState,String foodToMarket) = _Loaded;
}
