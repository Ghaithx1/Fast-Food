import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListDialogItem extends StatelessWidget {

  UserListDialogItem(this.user,{required this.onPressed,super.key});
  User user;
  ValueSetter<User> onPressed;

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
            alignment: Alignment.center,
            child: 
                Text(
                  user.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),              
            ),
          ),
        
        TextButton(
          style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(200.w, 200.h))),
          child: Text(''),
          onPressed: () {
            onPressed(user);
          },
        ),
      
      ]));
  }
}
