import 'package:bloc/bloc.dart';
import 'package:fast_food/feuters/orders_and_market/data/model/food_market.dart';
import 'package:fast_food/feuters/orders_and_market/data/repo/orders_and_market_repo.dart';
import 'package:fast_food/feuters/orders_and_market/logic/cubit/orders_and_market_state.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class OrdersAndMarketCubit extends Cubit<OrdersAndMarketState> {
  OrdersAndMarketRepo ordersAndMarketRepo = OrdersAndMarketRepo();
  OrdersAndMarketCubit() : super(OrdersAndMarketState.initial()){
    fetchData();
  }
  List<FoodMarket> Foods = [];
  String foodToMarket = '';
  double money = 0 ;
  void fetchData()async { 
    List<FoodMarket> response = await ordersAndMarketRepo.getFoodsToMarket();
    Foods = response;
    _sortTheData(response,FoodType.all);
  }

  void filterTheDataByType(FoodType type){
    List<FoodMarket> food = [];
    money = 0;
    for(var foodItem in Foods){
      print('The food type is ${foodItem.food_type.substring(9)} and the type is ${type.name} \n');
      if(type.name == FoodType.poca.name || type.name == FoodType.borek.name){  // This method if the type poca get the borek and the borek
          if(foodItem.food_type.substring(9) == FoodType.poca.name || foodItem.food_type.substring(9) == FoodType.borek.name ){
            food.add(foodItem);
            foodToMarket += '${foodItem.food_name} ${foodItem.quantity}\n';
          }
      }else if(type.name == FoodType.market.name || type.name == FoodType.coffe.name){  // This method if the type poca get the borek and the borek
          if(foodItem.food_type.substring(9) == FoodType.market.name || foodItem.food_type.substring(9) == FoodType.coffe.name ){
            food.add(foodItem);
          }
      else if(foodItem.food_type.substring(9) == type.name){
        food.add(foodItem);
      }
    }
    }
    print(food);
    _sortTheData(food,type);
  }


  
  void _sortTheData(List<FoodMarket> foods,FoodType food_type) {
    foods.sort((a, b) => a.id!.compareTo(b.id!),);
    _filterTheDate(foods,food_type);
    
  }
  
  void _filterTheDate(List<FoodMarket> foods,FoodType food_type) {
  List<FoodMarket> filteredFood = [];
    for(var food in foods){
      if(filteredFood.length == 0){
        filteredFood.add(food);
      }else if(food.id == filteredFood[filteredFood.length - 1].id){
        filteredFood[filteredFood.length - 1].quantity += food.quantity;
      }else if(food.id != filteredFood[filteredFood.length - 1].id){
        filteredFood.add(food);
      }
      print('add money ${food.food_price}');
      money += food.food_price * food.quantity;
    }
    emit(OrdersAndMarketState.loaded(filteredFood,money,food_type,foodToMarket));
    print(filteredFood);
  }
}
