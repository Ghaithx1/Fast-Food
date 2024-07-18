import 'package:fast_food/core/helpers/spcaing.dart';
import 'package:fast_food/core/routing/routes.dart';
import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/core/theming/styles.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders/orders_cubit.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders/orders_state.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_cubit.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_state.dart';
import 'package:fast_food/feuters/orders_managment/logic/users/users_cubit.dart';
import 'package:fast_food/feuters/orders_managment/logic/users/users_state.dart';
import 'package:fast_food/feuters/orders_managment/widgets/screen_widgets/drawer_elements.dart';
import 'package:fast_food/feuters/orders_managment/widgets/food_dialog/food_list_dialog.dart';
import 'package:fast_food/feuters/orders_managment/widgets/screen_widgets/main_column_widget.dart';
import 'package:fast_food/feuters/orders_managment/widgets/user_dialog/user_list_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageOrdersScreenNew extends StatefulWidget {
  const ManageOrdersScreenNew({super.key});

  @override
  State<ManageOrdersScreenNew> createState() => _ManageOrdersScreenNewState();
}

class _ManageOrdersScreenNewState extends State<ManageOrdersScreenNew> {
  User? currentUser ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
        'Fast Food',
        style: styles.mainorange30italic,
      )),
      drawer: const Drawer(
        child: DrawerElements(),
      ),
      body:MultiBlocListener(
      listeners: [
        BlocListener<UsersCubit, UsersState>(
          listener: (context, state) => handleUsersState(context, state),
        ),
        BlocListener<OrdersCubit,OrdersState>(
          listener: (context, state) => handleOrderState(context, state,currentUser),
          )
      ],
      
      
      child:  BlocBuilder<OrdersManegmentCubit, OrdersManegmentState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Center(child: CircularProgressIndicator()),
            Loaded: (user, foods, money) {
                currentUser = user;
                return MainColumnWidget(user: user, foods: foods, money: money);
                },
          );
        },
      ),
    ),);
  }
  
  void handleUsersState(BuildContext context, UsersState state) {
    state.when(
      initial: () {},
      getAllUsers: (Userslist) {
        showDialog(
          context: context,
          builder: (_) => userListDialog(
            Userslist,
            addUser: (user) {
              BlocProvider.of<OrdersManegmentCubit>(context).addUser(User(name: user, money: 0.0,taken: false));
              Navigator.of(context).pop();
              BlocProvider.of<OrdersManegmentCubit>(context).fetchUsersWithoutAction();
            },
            choseUser: (user) {
              _handleUserChose(user);
            },
            showAllUsers: (){
              Navigator.of(context).pop();
              BlocProvider.of<UsersCubit>(context).ShowsAllUsers();
            },
          ),
        );
      },
    );
  }
  
  handleOrderState(BuildContext context, OrdersState state, User? currentUser) {
    state.when(
                  getFoodsList: (foodList, type) {
                    print(foodList);
                    showDialog(
                        context: context,
                        builder: (_) {
                          return foodListDialog(
                            foodList,
                            addFood: (foodPrice, foodName) {
                              BlocProvider.of<OrdersManegmentCubit>(context)
                                  .addFood(Food(
                                      name: foodName,
                                      price: foodPrice,
                                      foodType: type));
                              Navigator.of(context).pop();
                              BlocProvider.of<OrdersCubit>(context).fetchData();
                            },
                            choseFood: (food) {
                              BlocProvider.of<OrdersManegmentCubit>(context)
                                  .addFoodForUser(currentUser!, food);
                              Navigator.of(context).pop();
                            },
                          );
                        });
                  },
                  initial: () => {},
                  addressLoadSuccess: () {});
  }
  
  void _handleUserChose(User user) {
    BlocProvider.of<OrdersManegmentCubit>(context).getTheUser(user);
    Navigator.of(context).pop();
  }
}


