import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/core/theming/styles.dart';
import 'package:fast_food/feuters/orders_and_market/data/model/food_market.dart';
import 'package:flutter/material.dart';

class FoodMarketItem extends StatelessWidget {
  FoodMarketItem(this.foodMarket, {super.key});
  FoodMarket foodMarket;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: colorManager.mainorange)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                foodMarket.food_name,
                style: styles.item36BoldBlack.copyWith(fontSize: 40),
              ),
              Text(
                foodMarket.quantity.toString(),
                style: styles.irishGrover40boldBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
