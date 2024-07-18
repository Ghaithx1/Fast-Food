import 'package:fast_food/core/storage/app_database.dart';
import 'package:sqflite/sqflite.dart';

class OrdersAndNameDb{
  Future<Database?> get _db async{
    return await AppDataBase.db;
  }

  Future<List<Map<String, dynamic>>> readNameWithFoods() async {
    Database? mydb = await _db;
    List<Map<String,dynamic>> response =await mydb!.rawQuery('''
    SELECT 
        UserWithFood.user_id,
        User.name AS user_name,
        User.double,
        Food.name AS food_name,
        UserWithFood.quantity
      FROM
        UserWithFood
      INNER JOIN User ON UserWithFood.user_id = User.id
      INNER JOIN Food ON UserWithFood.food_id = Food.id
''');
  print('the response is $response');
  return response;
  }
}

