import 'package:fast_food/feuters/orders_and_name/widgets/food_item.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodItemDism extends StatelessWidget {
  FoodItemDism({required this.addFood , required this.DeleteFood , required this.food,super.key});
  ValueSetter<int> addFood;
  ValueSetter<int> DeleteFood;
  UserWithFood food;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
                      key: UniqueKey(),
                      child: foodItem(food),
                      direction: DismissDirection.horizontal,
                      onDismissed: (DismissDirection direction) {
                        // Your action when item is dismissed goes here
                        if (direction == DismissDirection.endToStart) {
                          // Swiped to the left (Remove)
                          DeleteFood(food.food_id);
                        } else if (direction == DismissDirection.startToEnd) {
                          // Swiped to the right (Add Food)
                          addFood(food.food_id);
                        }
                      },
                            background: Container(
        color: Colors.green, // Customize the background color for left swipe
        alignment: Alignment.centerLeft,
        child: Icon(Icons.add, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red, // Customize the background color for right swipe
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white),
      ),

                      );
              
  }
}