import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class AppDataBase{
  static Database? datab;

  static Future<Database?> get db async{
    if(datab == null){
      datab = await intialDataBase();
      return datab;
    }
    return datab;
  }
  static intialDataBase()async{
    String databasPath = await getDatabasesPath();
    String path = join(databasPath,'food.db');
    Database AppDataBase  =await openDatabase(path , onCreate:  _onCreate,version: 1);
    return AppDataBase;
    }

  static  _onCreate(Database db,int version)async{
      await db.execute('''
      CREATE TABLE 'User'(
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT NOT NULL,
      "money" REAL NOT NULL,
      "taken" BOOL NOT NULL,
      "double" REAL
      )
''');
await db.execute('''
      CREATE TABLE 'Food'(
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT NOT NULL,
      "price" REAL NOT NULL,
      "foodType" TEXT NOT NULL
      )
''');

await db.execute('''
   CREATE TABLE 'UserWithFood' (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "food_name" TEXT NOT NULL,
    "user_id" INTEGER,
    "food_id" INTEGER,
    "quantity" INTEGER,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (food_id) REFERENCES Food(id)
    )
''');

  print('The DataBase Created Successfully ===================');
}


}