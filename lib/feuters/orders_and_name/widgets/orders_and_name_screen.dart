import 'package:fast_food/feuters/orders_and_name/data/model/user_and_foods.dart';
import 'package:fast_food/feuters/orders_and_name/data/repo/orders_with_name_repo.dart';
import 'package:fast_food/feuters/orders_and_name/logic/cubit/orders_and_name_cubit.dart';
import 'package:fast_food/feuters/orders_and_name/logic/cubit/orders_and_name_state.dart';
import 'package:fast_food/feuters/orders_and_name/widgets/list_view_name_and_food_item.dart';
import 'package:fast_food/feuters/orders_and_name/widgets/search_bar.dart';
import 'package:fast_food/feuters/orders_and_name/widgets/type_button.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersAndNameScreen extends StatefulWidget {
  OrdersAndNameScreen({super.key});

  @override
  State<OrdersAndNameScreen> createState() => _OrdersAndNameScreenState();
}

class _OrdersAndNameScreenState extends State<OrdersAndNameScreen> {
  TextEditingController _searchText = TextEditingController();

  OrdersWithNameRepo ordersWithNameRepo = OrdersWithNameRepo();

  List<UserAndFoods> food = [];

  List<UserAndFoods> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildSearchBar(
                    _searchText,
                    onChanged: (String text) {
                      _searchInTheList(text);
                      setState(() {});
                    },
                  ),
                  TypeButton(
                    voidCallbackAction: () {
                      _searchInTypeMarketOrFood();
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<OrdersAndNameCubit, OrdersAndNameState>(
                builder: (context, state) {
                  return state.when(
                    initial: () {
                      return Text('hello');
                    },
                    loaded: (foods) {
                      food = foods;
                      return Expanded(
                        child: GridView.builder(  
                          gridDelegate:
                            SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300.h,
                            mainAxisExtent: 250.w,
                            mainAxisSpacing: 20.h,
                            crossAxisSpacing: 25.w,
                          ),
                          itemCount: searchList.isEmpty
                              ? food.length
                              : searchList.length,
                          itemBuilder: (context, index) {
                            return ListViewNameAndFoodItem(searchList.isEmpty
                                ? food[index]
                                : searchList[index]);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _searchInTheList(String SearchText) {
    searchList = food.where((food) {
      if (food.userName.toLowerCase().startsWith(SearchText)) {
        return food.userName.toLowerCase().startsWith(SearchText);
      } else {
        return food.foods
            .where(
                (foods) => foods.food_name.toLowerCase().startsWith(SearchText))
            .toList()
            .isNotEmpty;
      }
    }).toList();
  }

  void _searchInTypeMarketOrFood() {
    //Todo i will do it search in the food by it's type 
  }
}
