import 'package:fast_food/feuters/orders_and_name/data/local_storage/orders_and_name_db.dart';
import 'package:fast_food/feuters/orders_and_name/data/model/user_and_foods.dart';
import 'package:fast_food/feuters/orders_managment/data/local_storage/orders_managment_db.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';


class OrdersWithNameRepo{
  OrdersAndNameDb dataBase = OrdersAndNameDb();
  OrdersManagmentDb ordersManagmentDb = OrdersManagmentDb();

  Future<List<UserAndFoods>> getNameWithFoods()async{
    List<UserAndFoods> result =[];
    List<Map<String,dynamic>> response = await ordersManagmentDb.read('User');
    List<User> users = response.map((data) => User.fromMap(data)).toList();
    
    for(var user in users){
      List<Map<String,dynamic>> response = await ordersManagmentDb.getFoodByUserId(user.id!);
      List<UserWithFood> foods = response.map((e) => UserWithFood.fromMap(e)).toList();
      result.add(UserAndFoods(userName: user.name, doubt: user.doubt??0, foods: foods));
    }
    print("The result is $result");
    return result;
  }
}