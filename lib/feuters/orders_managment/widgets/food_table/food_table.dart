import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:fast_food/feuters/orders_and_name/widgets/food_item.dart';
import 'package:fast_food/feuters/orders_managment/widgets/buttons/next_button.dart';
import 'package:fast_food/feuters/orders_managment/widgets/food_table/food_item_dism.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTable extends StatelessWidget {
  List<UserWithFood> food;
  ValueSetter<int> addFood;
  ValueSetter<int> deleteFood;
  FoodTable(this.food, {required this.addFood,required this.deleteFood, Key? key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorManager.mainorange, width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.h),
            topRight: Radius.circular(22.h),
          ),
        ),
        child: Column(
          // Use Column to position foodItem at the top
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: food.length,
                itemBuilder: (context, index) {
                  return FoodItemDism(addFood: (food_id) {
                    addFood(food_id);
                  }, DeleteFood: (food_id) {
                    deleteFood(food_id);  
                  }, food: food[index]); 
                   },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
