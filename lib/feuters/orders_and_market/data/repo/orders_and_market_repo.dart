import 'package:fast_food/feuters/orders_and_market/data/local_storage/orders_and_market_local.dart';
import 'package:fast_food/feuters/orders_and_market/data/model/food_market.dart';

class OrdersAndMarketRepo{
  OrdersAndMarketDb ordersAndMarketDb = OrdersAndMarketDb();

  Future<List<FoodMarket>> getFoodsToMarket()async{
    List<Map<String,dynamic>> response = await ordersAndMarketDb.getFoodsToMarket();
    List<FoodMarket> foods = response.map((data) => FoodMarket.fromMap(data)).toList();
    return foods;
  }
}