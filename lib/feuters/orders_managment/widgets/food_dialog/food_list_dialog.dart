import 'dart:ffi';

import 'package:fast_food/core/helpers/functoins.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user_with_food.dart';
import 'package:fast_food/feuters/orders_managment/widgets/food_dialog/food_list_dialog_item.dart';
import 'package:fast_food/feuters/orders_managment/widgets/buttons/next_button.dart';
import 'package:flutter/material.dart';


class foodListDialog extends StatelessWidget {
  foodListDialog(this.foods,{required this.choseFood,required this.addFood,super.key});
  List<Food> foods;
  ValueSetter<Food> choseFood;
  ValueSetter2<double, String> addFood;
  TextEditingController foodName = TextEditingController() ;
  TextEditingController foodPrice = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    content: Builder(
      builder: (context) {
        // Get available height and width of the build area of this widget. Make a choice depending on the size.
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Container(
          height: height - 250,
          width: width,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return FoodListDialogItem(foods[index],onPressed: (value) => choseFood(value),);
                  },
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 4 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                ),
              ),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(hintText: "Food Name"),controller: foodName,)),
                  SizedBox(width: 10,),    
                  Expanded(child: TextFormField(decoration: InputDecoration(hintText: "Food Price"),keyboardType:TextInputType.number,controller: foodPrice,)),    
                  SizedBox(width: 10,), 
                  nextButton(text: "Add", () {addFood(double.parse(foodPrice.text),foodName.text);},fontSize: 32,),
                ],
              )
            ],
          ),
        );
      },
    ),
  );
  }
}
