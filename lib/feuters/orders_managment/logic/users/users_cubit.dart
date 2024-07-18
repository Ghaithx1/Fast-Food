import 'package:bloc/bloc.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/data/repo/orders_managment_rep.dart';
import 'package:fast_food/feuters/orders_managment/logic/users/users_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class UsersCubit extends Cubit<UsersState> {
  OrdersManagmentRepo ordersManagmentRepo = OrdersManagmentRepo();
  UsersCubit() : super(UsersState.initial()){
    
  }

  void getTheUsers()async{
    List<User> users = await ordersManagmentRepo.GetTheUsersHavenWriteFoodYet();
    emit(UsersState.initial());
    emit(UsersState.getAllUsers(users));
  }

  void ShowsAllUsers()async{
    List<User> users = await ordersManagmentRepo.GetAllUsers();
    emit(UsersState.initial());
    emit(UsersState.getAllUsers(users));
  }}
