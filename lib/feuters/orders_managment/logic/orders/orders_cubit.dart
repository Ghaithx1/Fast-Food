import 'package:bloc/bloc.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/repo/orders_managment_rep.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders/orders_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class OrdersCubit extends Cubit<OrdersState> {
  OrdersManagmentRepo ordersManagmentRepo = OrdersManagmentRepo();
  OrdersCubit() : super(OrdersState.initial()){
fetchData();
  }

  Map<int,bool> food = Map();

  List<Food> yali= []; 
  List<Food> poca= []; 
  List<Food> ekmek= []; 
  List<Food> coffe= []; 
  List<Food> market= []; 
  List<Food> borek= []; 

  //TODO: make map to save the id of the foods that you saved in the lists
  
  void fetchData()async{
   List<Food> foods = await ordersManagmentRepo.readAllFoods();
  // print('why its not working and the ${foods.length}');
   foods.forEach((item) {
          switch (item.foodType) {
            case FoodType.coffe:
              if(_checkIfItsInMap(item))coffe.add(item);
              break;
            case FoodType.ekmek:
              if(_checkIfItsInMap(item))ekmek.add(item);
              break;
            case FoodType.market:
              if(_checkIfItsInMap(item))market.add(item);
              break;
            case FoodType.poca:
              if(_checkIfItsInMap(item))poca.add(item);
              break;
            case FoodType.borek:
              if(_checkIfItsInMap(item))borek.add(item);
              break;      
            case FoodType.yali:
              if(_checkIfItsInMap(item))yali.add(item);
              break;      
            default:
          }
   },);
  }
  bool _checkIfItsInMap(Food item){
if(food[item.id] == null){
               food[item.id!] = true;
               return true;
              }
              return false;
  }

  void getTheListOfType(FoodType type){
   
    if(type == FoodType.coffe){
      emit(OrdersState.getFoodsList(coffe,type));
    }
    switch (type) {
            case FoodType.coffe:
                emit(OrdersState.getFoodsList(coffe,type));
              break;
            case FoodType.ekmek:
                emit(OrdersState.getFoodsList(ekmek,type));
              break;
            case FoodType.market:
                emit(OrdersState.getFoodsList(market,type));
              break;
            case FoodType.poca:
                emit(OrdersState.getFoodsList(poca,type));
              break;
            case FoodType.borek:
                emit(OrdersState.getFoodsList(borek,type));
              break;        
            case FoodType.yali:
                emit(OrdersState.getFoodsList(yali,type));
              break;    
            default:
          }
  }

  void LoadThecubit(){
    emit(OrdersState.addressLoadSuccess());
    fetchData();
  }
}
