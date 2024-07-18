import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/core/theming/styles.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class foodItem extends StatelessWidget {
  foodItem(this.food,{super.key});
  UserWithFood food;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h ,vertical: 5.w),
      decoration: BoxDecoration(
        color:colorManager.morelightorange,
        borderRadius: BorderRadius.circular(22),
        
        ),
        
        width: 350.w,
        height: 70.h,
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(margin: EdgeInsets.only(left: 5),  child: Text(food.food_name,style : styles.item36BoldBlack.copyWith(fontSize: 40))),
            Container(margin: EdgeInsets.only(right: 5), child: Text(food.quantity.toString(),style: styles.BlackregularBlack32,),)
          ],
        ),
        
    );
  }
}