import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/core/theming/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TypeButton extends StatefulWidget {
  TypeButton({required this.voidCallbackAction,super.key});
   VoidCallback voidCallbackAction ;

  @override
  State<TypeButton> createState() => _TypeButtonState();
}

class _TypeButtonState extends State<TypeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      widget.voidCallbackAction();
      
    },
      style: ButtonStyle(
        backgroundColor:WidgetStatePropertyAll(colorManager.mainorange),

      ), child: Text('Type',style: styles.BlackInter28Black
      ,),
    );
  }
}