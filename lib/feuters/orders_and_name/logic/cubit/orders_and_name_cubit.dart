import 'package:bloc/bloc.dart';
import 'package:fast_food/feuters/orders_and_name/data/model/user_and_foods.dart';
import 'package:fast_food/feuters/orders_and_name/data/repo/orders_with_name_repo.dart';
import 'package:fast_food/feuters/orders_and_name/logic/cubit/orders_and_name_state.dart';
import 'package:fast_food/feuters/orders_and_name/widgets/orders_and_name_screen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class OrdersAndNameCubit extends Cubit<OrdersAndNameState> {
  OrdersWithNameRepo ordersWithNameRepo =OrdersWithNameRepo();
  OrdersAndNameCubit() : super(OrdersAndNameState.initial()) {
    catchData();
  }
  List<UserAndFoods> Foods=[];

  void catchData()async{
    List<UserAndFoods> response = await ordersWithNameRepo.getNameWithFoods();
    print('this is the response $response');
    response.forEach((element) {
    if(element.foods.isNotEmpty)Foods.add(element);
    },);
    
    emit(OrdersAndNameState.loaded(Foods));
  }
}
