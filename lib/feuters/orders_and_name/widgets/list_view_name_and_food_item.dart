import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/core/theming/styles.dart';
import 'package:fast_food/feuters/orders_and_name/data/model/user_and_foods.dart';
import 'package:fast_food/feuters/orders_and_name/widgets/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewNameAndFoodItem extends StatelessWidget {
  ListViewNameAndFoodItem(this.userAndFoods, {super.key});
  UserAndFoods userAndFoods;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: colorManager.mainorange,
            width: 2,
          )),
      child: Column(children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 7.0.h, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userAndFoods.userName,
                style: styles.BlackInter28Black,
              ),
              Text(userAndFoods.doubt.toString(),
                style: styles.BlackInter28Black,
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 2,
          color: colorManager.mainorange,
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: userAndFoods.foods.length,
          
          itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
                  //color: colorManager.morelightorange,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),color: colorManager.morelightorange),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userAndFoods.foods[index].food_name,
                          style: styles.BlackInter20Black,
                        ),
                        Text(
                          userAndFoods.foods[index].quantity.toString(),
                          style: styles.BlackInter20Black,
                        ),
                      ],
                    ),
                  )),
          );
          },
        ))
      ]),
    );
  }
}
