import 'package:fast_food/core/storage/app_database.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:sqflite/sqflite.dart';
class OrdersManagmentDb{
  Future<Database?> get _db async{
   return await AppDataBase.db;
  }

  readData(String sql)async{
    Database? my_db = await _db;
    if(my_db != null){
    List<Map> response =await my_db.rawQuery(sql);
    return response;}
    else{
      print('There is not DataBase');
    }
  }
  Future<int> insertData(String sql)async{
    Database? my_db = await _db;
    if(my_db != null){
    int response =await my_db.rawInsert(sql);
    return response;}
    else{
      print('There is not DataBase');
      return 0;
    }
  }
  deleteData(String sql)async{
    Database? my_db = await _db;
    int response =await my_db!.rawDelete(sql);
    return response;
  }
  upadateData(String sql)async{
    Database? my_db = await _db;
    int response =await my_db!.rawUpdate(sql);
    return response;
  }

  Future<List<Map<String,dynamic>>> read(String table)async{
    Database? my_db = await _db;
    List<Map<String,dynamic>> response =await my_db!.query(table);
    return response;
  }
  insert(String table,Map<String, Object?> values)async{
    Database? my_db = await _db;
    int response =await my_db!.insert(table,values);
    return response;
  }
  delete(String table ,String? mywhere )async{
    Database? my_db = await _db;
    int response =await my_db!.delete(table,where: mywhere);
    return response;
  }
  upadate(String table,Map<String, Object?> values,String? mywhere)async{
    Database? my_db = await _db;
    int response =await my_db!.update(table,values,where: mywhere);
    return response;
  }
  Future<List<Map<String, dynamic>>> getFoodByUserId( int userId) async {
  Database? my_db = await _db;
  final List<Map<String, dynamic>> result = await my_db!.rawQuery('''
    SELECT *
    FROM UserWithFood
    WHERE UserWithFood.user_id = ?
  ''', [userId]);
  return result;
}

Future<List<Map<String, dynamic>>> checkIfFoodForUserExistsAndAdd(
    int userId, Food food) async {
  final Database? my_db = await _db; // Assuming '_db' is your database connection

  // Check if a record exists
  final int count = Sqflite.firstIntValue(await my_db!.rawQuery(
      ''' SELECT COUNT(*) FROM UserWithFood WHERE user_id = ? AND food_id = ? ''',
      [userId, food.id!]))!; 

  if (count > 0) {
    // Update quantity if record exists
    await my_db.rawUpdate('''
      UPDATE UserWithFood SET quantity = quantity + 1
      WHERE user_id = ? AND food_id = ?
    ''', [userId, food.id!]);
  } else {
    // Insert a new record if it doesn't exist
    await my_db.insert('UserWithFood', {
      'user_id': userId,
      'food_id': food.id!,
      'quantity': 1,
      'food_name': food.name,
    });
  }

  // Fetch and return the updated record
  return my_db.rawQuery('''
    SELECT * FROM UserWithFood 
    WHERE user_id = ? AND food_id = ?
  ''', [userId, food.id!]);
}
Future<List<Map<String, dynamic>>> checkIfFoodForUserExistsAndRemove(
    int userId, Food food) async {
  final Database? my_db = await _db; // Assuming '_db' is your database connection

  // Check if a record exists
  final int count = Sqflite.firstIntValue(await my_db!.rawQuery(
      ''' SELECT quantity FROM UserWithFood WHERE user_id = ? AND food_id = ? ''',
      [userId, food.id!]))!; 
  print('The quantity of food befor removing is $count');
  if (count > 1) {
    // Update quantity if record exists
    await my_db.rawUpdate('''
      UPDATE UserWithFood SET quantity = quantity - 1
      WHERE user_id = ? AND food_id = ?
    ''', [userId, food.id!]);
    print('Now it removed');
  } else if(count == 1) {
    await my_db.rawUpdate('''
      DELETE FROM UserWithFood
WHERE user_id = ? AND food_id = ?;
    ''', [userId, food.id!]);
  }

  // Fetch and return the updated record
  return my_db.rawQuery('''
    SELECT * FROM UserWithFood 
    WHERE user_id = ? AND food_id = ?
  ''', [userId, food.id!]);
}

addMoneyForUser(int userId, double money) async {
  final Database? my_db = await _db; // Assuming '_db' is your database connection
  await my_db!.rawUpdate('''
    UPDATE User SET money = money +?
    WHERE id =?
  ''', [money, userId]);
}

  Future<List<Map<String, dynamic>>> getUserById(int id) async{
    final Database? myDb = await _db;
    final List<Map<String, dynamic>> result = await myDb!.rawQuery('''
    SELECT *
    FROM User
    WHERE id = ?
''',[id]);
return result;
  }

  void addTakenToUser(int user_id) async {
    final Database? myDb = await _db;
    final List<Map<String, dynamic>> result = await myDb!.rawQuery('''
    UPDATE User
    SET taken = "true"
    WHERE id = ?
''',[user_id]);
  }

  Future<List<Map<String, dynamic>>> GetTheUsersHavenWriteFoodYet() async {
    final Database? myDb = await _db;
    final List<Map<String, dynamic>> result = await myDb!.rawQuery('''
    SELECT *
    FROM User
    WHERE taken = "false"
''');
print('the result is $result');
return result;

  }
   Future<List<Map<String, dynamic>>> GetTheFoodById(int food_id) async {
    final Database? myDb = await _db;
    final List<Map<String, dynamic>> result = await myDb!.rawQuery('''
    SELECT *
    FROM Food
    WHERE id = ?
''',[food_id]);
print('the result is $result');
return result;

  }

  void RefactorUsers() async {
    final Database? myDb = await _db;
    final List<Map<String, dynamic>> result = await myDb!.rawQuery('''
    UPDATE User 
    SET taken = "false" , money = 0
    WHERE taken = "true";
''');
  }

  void RefactorUserWithFood() async {
    final Database? myDb = await _db;
    final List<Map<String, dynamic>> result = await myDb!.rawQuery('''
    DELETE FROM UserWithFood;
''');
  }

  Future<int> RemoveMoneyForUser(int userId, double money)async {
    final Database? my_db = await _db; // Assuming '_db' is your database connection
  var response = await my_db!.rawUpdate('''
    UPDATE User SET money = money -?
    WHERE id =?
  ''', [money, userId]);
    return response;
  }
}
