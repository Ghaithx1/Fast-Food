import 'package:bloc/bloc.dart';
import 'package:fast_food/feuters/orders_and_market/data/model/food_market.dart';
import 'package:fast_food/feuters/orders_and_market/data/repo/orders_and_market_repo.dart';
import 'package:fast_food/feuters/orders_and_market/logic/cubit/orders_and_market_state.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OrdersAndMarketCubit extends Cubit<OrdersAndMarketState> {
  OrdersAndMarketRepo ordersAndMarketRepo = OrdersAndMarketRepo();
  OrdersAndMarketCubit() : super(OrdersAndMarketState.initial()) {
    fetchData();
  }
  List<FoodMarket> foods = [];
  String foodToMarket = '';
  double money = 0;
  void fetchData() async {
    List<FoodMarket> response = await ordersAndMarketRepo.getFoodsToMarket();
    foods = response;
    _sortTheData(foods, FoodType.all);
  }
 
  void filterTheDataByType(FoodType type)async {
    foods = await ordersAndMarketRepo.getFoodsToMarket();
    List<FoodMarket> filterdList = [];
    for (var food in foods) {
      if (food.food_type.substring(9) == type.name) {
        filterdList.add(food);
      }
    }
    print('it might the wrong be from here $foods');
    _sortTheData(filterdList, type);
  }

  void _sortTheData(List<FoodMarket> foods, FoodType food_type) {
    money = 0;
    foods.sort(
      (a, b) => a.id!.compareTo(b.id!),
    );
    _filterTheDate(foods, food_type);
  }

  void _filterTheDate(List<FoodMarket> foods, FoodType food_type) {
    List<FoodMarket> filteredFood = [];
    filteredFood.add(foods[0]);
    money += foods[0].food_price * foods[0].quantity;
    for (var x = 1; x < foods.length; x++) {
      var currentFood = foods[x];
      filteredFood = _addOrUpdateFood(filteredFood, currentFood);
      _writeFoodForPastaneci(currentFood);
      money += currentFood.food_price * currentFood.quantity;
    }
    emit(OrdersAndMarketState.loaded(
        filteredFood, money, food_type, foodToMarket));
  }

  List<FoodMarket> _addOrUpdateFood(
      List<FoodMarket> filteredFood, FoodMarket currentFood) {
    var lastElement = filteredFood.length - 1;

    if (currentFood.id == filteredFood[lastElement].id) {
      filteredFood[lastElement].quantity += currentFood.quantity;
    } else {
      filteredFood.add(currentFood);
    }
    return filteredFood;
  }

  void _writeFoodForPastaneci(FoodMarket currentFood) {
    if (currentFood.food_type.substring(9) == FoodType.borek.name ||
        currentFood.food_type.substring(9) == FoodType.poca.name) {
      foodToMarket += '${currentFood.food_name} ${currentFood.quantity}\n';
    }
  }

  void filterTheDataByBothType(FoodType type1, FoodType type2) async {
        foods = await ordersAndMarketRepo.getFoodsToMarket();
    List<FoodMarket> filterdList = [];
    for (var food in foods) {
      if (food.food_type.substring(9) == type1.name ||food.food_type.substring(9) == type2.name ) {
        filterdList.add(food);
      }
    }
    print('it might the wrong be from here $foods');
    _sortTheData(filterdList, type1);
  }
}
