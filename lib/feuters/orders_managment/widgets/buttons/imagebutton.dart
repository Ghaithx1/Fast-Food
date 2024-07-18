import 'package:fast_food/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class imageButton extends StatelessWidget {
  String iconPath;
  final VoidCallback onPressed;
  imageButton(this.iconPath, this.onPressed,{super.key});

  @override
  Widget build(BuildContext context) {
    //return TextButton.icon(icon:Icon(Icons.mail),onPressed:(){},label: Text('press me'), );
    return Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: colorManager.mainorange,
          borderRadius: BorderRadius.circular(22)
        ),
        child:Stack(
        children : [
          Positioned(child: Center(child: Image.asset(iconPath,width: 70.w,height: 70.h,)),right: 0,left: 0,top: 0,bottom: 0,),
          
          TextButton(
            style: ButtonStyle(minimumSize:MaterialStateProperty.all(Size(100.w,100.h))),
            child: Text(''),
                onPressed: onPressed,
                ),

                ]
        ),
      );
    
  }
}