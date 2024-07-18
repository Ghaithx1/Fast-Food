import 'package:fast_food/core/storage/app_database.dart';
import 'package:fast_food/feuters/orders_managment/data/local_storage/orders_managment_db.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';

class OrdersManagmentRepo {
  OrdersManagmentDb dataBase = OrdersManagmentDb();

  insertUser(User user)async{ 
  var response = await dataBase.insertData('''
    INSERT INTO User ('name','money','taken')
    VALUES ('${user.name}','${user.money}','${user.taken}')
    ''');
  }

  insertFood(Food food){
    var response =  dataBase.insert('Food',food.toMap());
  }

  insertFoodWithUser(Food food,User user,int Quantity){
    var response = dataBase.insert('UserWithFood',UserWithFood(food_id: food.id!,user_id: user.id!,quantity: Quantity,food_name: food.name ).toMap());
  }


  Future<List<UserWithFood>>
   getFoodByUserId(int user_id)async{
    List<Map<String,dynamic>> response = await dataBase.getFoodByUserId(user_id);
     List<UserWithFood> food = response.map((data) =>UserWithFood.fromMap(data)).toList();
     print('the response of getFoodByUserId is  $response');
     return food;
  }

  Future<List<User>> GetTheUsersHavenWriteFoodYet()async{
    List<Map<String,dynamic>> response = await dataBase.GetTheUsersHavenWriteFoodYet();
    List<User> users = response.map((data) => User.fromMap(data)).toList();
    return users;
  }

  Future<List<User>> GetAllUsers()async{
    List<Map<String,dynamic>> response = await dataBase.read('User');
    print(response);
    List<User> users = response.map((data) => User.fromMap(data)).toList();
    return users;
  }

    checkIfFoodForUserExistsAndAdd(User user ,Food food)async{
    List<Map<String,dynamic>> response = await dataBase.checkIfFoodForUserExistsAndAdd(user.id!,food);
    print('the response of userwhaterExists or not is  $response');
   
  }

  Future<List<Food>> readAllFoods()async{
    List<Map<String,dynamic>> response = await dataBase.read('Food');
    List<Food> food = response.map((data) =>Food.fromMap(data)).toList();
    print(response);
    return food;
  }

  void addMoneyForUser(int userid ,double price) {
    dataBase.addMoneyForUser(userid,price);
  }

  Future<User> getUserById(int id) async{
    List<Map<String,dynamic>> response =await dataBase.getUserById(id);
    User user = User.fromMap(response[0]);
    return user;
  }

  void addTakenToUser(int user_id) {
    dataBase.addTakenToUser(user_id);
  }

  void DeleteTheFoodsAndRefactorTheUsers(){
    dataBase.RefactorUsers();
    dataBase.RefactorUserWithFood();
  }

  Future<Food> getTheFoodById(int food_id)async {
  List<Map<String,dynamic>> response = await  dataBase.GetTheFoodById(food_id);
  print(response);
  List<Food> food = response.map((data) =>Food.fromMap(data)).toList();
  return food[0];
  }

  removeFoodFromUser(User user, Food food) async{
    await  dataBase.checkIfFoodForUserExistsAndRemove(user.id!, food);
  }

  void RemoveMoneyForUser(int userid, double price) {
    dataBase.RemoveMoneyForUser(userid,price);
  }  

}