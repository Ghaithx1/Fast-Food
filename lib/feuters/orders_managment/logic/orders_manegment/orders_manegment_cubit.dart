import 'package:bloc/bloc.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:fast_food/feuters/orders_managment/data/repo/orders_managment_rep.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_state.dart';
import 'package:meta/meta.dart';


class OrdersManegmentCubit extends Cubit<OrdersManegmentState> {
  OrdersManagmentRepo ordersManagmentRepo ;
  OrdersManegmentCubit(this.ordersManagmentRepo) : super(OrdersManegmentState.initial()){ 

  }
  List<User> users = [];
  List<UserWithFood> usersWithFood = [];
  double money = 0;
  int index = -1;


  void fetchUsers() async { //First thing when anitializing the cubit it fetch the users
    emit(OrdersManegmentState.Loading());
    index = -1;
    List<User> respnse  = await ordersManagmentRepo.GetTheUsersHavenWriteFoodYet();
    users = respnse ; // await _handelIfTheUsersIsEmpty(respnse);
    NextPerson();
  }



void NextPerson() async {
  money = 0;
  if (users.length == 0) {
   // fetchUsers();
   _sentUserAndFoodToScreenAndHandleIfItEmpty(null);
    return ;
  }
  print('I didnt excit' );
  index++;
  if (index >= users.length) {
    index = 0;
  }

  var response = await ordersManagmentRepo.getFoodByUserId(users[index].id!);
  var user = await ordersManagmentRepo.getUserById(users[index].id!);

  usersWithFood = response;

  _sentUserAndFoodToScreenAndHandleIfItEmpty(user);
}


  Future<List<User>> _handelIfTheUsersIsEmpty(List<User> users)async{
    List<User> response = [];
    if(users.isEmpty){
      response = await ordersManagmentRepo.GetAllUsers();
    }
    if(response.isEmpty) _sentUserAndFoodToScreenAndHandleIfItEmpty(null);
    return response;
  }




  _sentUserAndFoodToScreenAndHandleIfItEmpty(User? user){
    
    emit(OrdersManegmentState.Loaded(users.isEmpty ? User(name: "Add user",money: 0,taken: false):users[index],usersWithFood,0));
  }


  void fetchUsersWithoutAction()async{
    List<User> respnse  = await ordersManagmentRepo.GetTheUsersHavenWriteFoodYet();
    users = respnse;
    emit(OrdersManegmentState.Loaded(users[index],usersWithFood,users[index].money));
  }


  void addFood(Food food) async {
    ordersManagmentRepo.insertFood(food);
  }


  void addUser(User user) async {
    ordersManagmentRepo.insertUser(user);
  }

  void DeleteTheFoodsAndRefactorTheUsers(){
    ordersManagmentRepo.DeleteTheFoodsAndRefactorTheUsers();
    fetchUsers();
  }

  void getFoodbyIdAndAddFoodOrRemove(User user,int food_id,bool AddOrRemove)async{
        print('The food is');
    Food food =  await ordersManagmentRepo.getTheFoodById(food_id);
    if(AddOrRemove){
    addFoodForUser(user, food);
    }else{
    removeFoodForUser(user,food);  
    }
  }

  


  void addFoodForUser(User user,Food food) async {


    var respon = await ordersManagmentRepo.checkIfFoodForUserExistsAndAdd(user, food);
    var response = await ordersManagmentRepo.getFoodByUserId(user.id!);

    usersWithFood = response;
    money += food.price;
    ordersManagmentRepo.addMoneyForUser(user.id!, food.price);
    ordersManagmentRepo.addTakenToUser(user.id!);
    emit(OrdersManegmentState.Loaded(user,response,money));

  }

  void removeFoodFromUser(User user,Food food)async{
    ordersManagmentRepo.removeFoodFromUser(user, food);
  }



  void getTheUser(User user) async{
    var response = await ordersManagmentRepo.getFoodByUserId(user.id!);
    usersWithFood = response;    
    emit(OrdersManegmentState.Loaded(user,response,user.money));
  }
  
  void removeFoodForUser(User user, Food food)async{
    var respon = await ordersManagmentRepo.removeFoodFromUser(user, food);
    ordersManagmentRepo.RemoveMoneyForUser(user.id!, food.price);
    money -= food.price;
    var response = await ordersManagmentRepo.getFoodByUserId(user.id!);
    print('the list after work is $response');
    usersWithFood = response;
    emit(OrdersManegmentState.Loaded(user,response,money));
  }
}
