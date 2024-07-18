import 'package:fast_food/feuters/orders_and_market/widgets/food_type_dialog_item.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/widgets/user_dialog/user_list_dialog_item.dart';
import 'package:flutter/material.dart';

class FoodTypeDialog extends StatelessWidget {
  FoodTypeDialog({required this.changeTheType,super.key});
  ValueSetter<FoodType> changeTheType;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
    content: Builder(builder: (context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Container(
          height: height - 500,
          width: width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                FoodTypeDialogItem(FoodType.market, onPressed: (value) => changeTheType(value),),
                FoodTypeDialogItem(FoodType.yali, onPressed: (value) => changeTheType(value),),
              ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                FoodTypeDialogItem(FoodType.ekmek, onPressed: (value) => changeTheType(value),),
                FoodTypeDialogItem(FoodType.poca, onPressed: (value) => changeTheType(value),),
              ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                //FoodTypeDialogItem(FoodType.sigara, onPressed: (value) => changeTheType(value),)
              ],)
            ],
          ),
        );
    },)
    );
  }

  void _changeTheType(FoodType typ){
    changeTheType(typ);
  }
}