import 'package:fast_food/core/storage/app_database.dart';
import 'package:sqflite/sqflite.dart';

class OrdersAndMarketDb{
  Future<Database?> get _db async{
    return await AppDataBase.db;
  }
   Future<List<Map<String, dynamic>>> getFoodsToMarket() async {
    Database? mydb = await _db;
    List<Map<String,dynamic>> response =await mydb!.rawQuery('''
    SELECT 
    Food.id,
    Food.name as food_name,
    Food.foodType as food_type,
    UserWithFood.quantity,
    Food.price as food_price
    FROM
      UserWithFood
    INNER JOIN Food ON UserWithFood.food_id = Food.id

''');
    return response;
   }
}