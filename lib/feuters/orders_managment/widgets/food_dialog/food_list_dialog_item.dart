import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodListDialogItem extends StatelessWidget {
  FoodListDialogItem(this.food, {required this.onPressed, super.key});
  Food food;
  ValueSetter<Food> onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
          // color: colorManager.mainorange,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: colorManager.mainorange, width: 2)),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  food.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  food.price.toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 100, 5),
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(200.w, 200.h))),
          child: Text(''),
          onPressed: () {
            onPressed(food);
          },
        ),
      ]),
    );
  }
}
