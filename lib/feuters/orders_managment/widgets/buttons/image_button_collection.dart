
import 'package:fast_food/core/helpers/spcaing.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/data/repo/orders_managment_rep.dart';
import 'package:fast_food/feuters/orders_managment/widgets/buttons/imagebutton.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class imageButtonCollection extends StatelessWidget {
  final ValueSetter<FoodType> onPressed;

    imageButtonCollection(this.onPressed,{super.key});
  String bread = 'assets/images/bread.png';
  String yali = 'assets/images/yali.png';
  String coffe = 'assets/images/coffe.png';
  String simit= 'assets/images/simit.png';
  String borek = 'assets/images/borek.png';
  String market = 'assets/images/market.png';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imageButton(bread,(){onPressed(FoodType.ekmek);}),
            imageButton(simit,(){onPressed(FoodType.poca,);}),
            imageButton(market,(){onPressed(FoodType.market);}),
          ],
        ),
        verticalspace(25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imageButton(yali,(){onPressed(FoodType.yali);}),
            imageButton(borek,(){onPressed(FoodType.borek);}),
            imageButton(coffe,(){onPressed(FoodType.coffe);}),
          ],
        )
      ],
    );
  }
}