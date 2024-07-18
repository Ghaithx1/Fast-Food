import 'package:fast_food/core/helpers/spcaing.dart';
import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders/orders_cubit.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_cubit.dart';
import 'package:fast_food/feuters/orders_managment/logic/users/users_cubit.dart';
import 'package:fast_food/feuters/orders_managment/widgets/food_table/food_table.dart';
import 'package:fast_food/feuters/orders_managment/widgets/buttons/image_button_collection.dart';
import 'package:fast_food/feuters/orders_managment/widgets/screen_widgets/name_text.dart';
import 'package:fast_food/feuters/orders_managment/widgets/buttons/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainColumnWidget extends StatelessWidget {
  final User user;
  final List<UserWithFood> foods;
  final double money;

  MainColumnWidget({required this.user, required this.foods, required this.money});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 10.w),
          child: Column(
            children: [
              Row(
                children: [
                  nameText(
                    text: user.name,
                    IsItHaveMethod: true,
                    ontap: () {
                      BlocProvider.of<UsersCubit>(context).getTheUsers();
                    },
                  ),
                  Expanded(child: Container()),
                  nameText(
                    bordercolor: colorManager.green,
                    money: money,
                    bordersize: 2.0,
                    hegiht: 70,
                    width: 100,
                    IsItHaveMethod: false,
                  ),
                ],
              ),
              verticalspace(48),
              imageButtonCollection(
                (value) {
                  BlocProvider.of<OrdersCubit>(context).LoadThecubit();
                  BlocProvider.of<OrdersCubit>(context).getTheListOfType(value);
                },
              ),
              verticalspace(20),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:5 ),
          child: nextButton(
            text: "Next",
            fontSize: 32,
            () {
              BlocProvider.of<OrdersManegmentCubit>(context).NextPerson();
            },
          ),
        ),
        FoodTable(foods,
        addFood: (foodId) {
          BlocProvider.of<OrdersManegmentCubit>(context).getFoodbyIdAndAddFoodOrRemove(user, foodId,true); // by adding true it mean make the add action
        },
        deleteFood: (foodId) {
          BlocProvider.of<OrdersManegmentCubit>(context).getFoodbyIdAndAddFoodOrRemove(user, foodId,false); // by adding false it mean make the remove action
        },
        ),
      ],
    );
  }
}
