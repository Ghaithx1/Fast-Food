import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/feuters/orders_and_market/data/repo/orders_and_market_repo.dart';
import 'package:fast_food/feuters/orders_and_market/logic/cubit/orders_and_market_cubit.dart';
import 'package:fast_food/feuters/orders_and_market/logic/cubit/orders_and_market_state.dart';
import 'package:fast_food/feuters/orders_and_market/widgets/food_market.dart';
import 'package:fast_food/feuters/orders_and_market/widgets/food_type_dialog.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/repo/orders_managment_rep.dart';
import 'package:fast_food/feuters/orders_managment/widgets/screen_widgets/name_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class OrdersAndMarketScreen extends StatelessWidget {
  OrdersAndMarketScreen({super.key});
  OrdersAndMarketRepo ordersAndMarketRepo = OrdersAndMarketRepo();
  String foodtoMarket = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async =>
              await launch("https://wa.me/${905519384959}?text=$foodtoMarket")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: BlocBuilder<OrdersAndMarketCubit, OrdersAndMarketState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  return Text('Loading');
                },
                loaded: (foods, money, currentType, foodToMarket) {
                  foodtoMarket = foodToMarket;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          nameText(
                            IsItHaveMethod: true,
                            ontap: () {
                              showDialog(
                                context: context,
                                builder: (contex) {
                                  return FoodTypeDialog(changeTheType: (type) {
                                    BlocProvider.of<OrdersAndMarketCubit>(
                                            context)
                                        .filterTheDataByType(type);
                                    Navigator.of(context).pop();
                                  }, changeTheBothType: (type1,type2) {
                                    BlocProvider.of<OrdersAndMarketCubit>(
                                            context)
                                        .filterTheDataByBothType(type1,type2);
                                    Navigator.of(context).pop();
                                  });
                                },
                              );
                            },
                            text: currentType.name,
                            width: 170,
                            hegiht: 50,
                          ),
                          nameText(
                            IsItHaveMethod: false,
                            bordercolor: colorManager.green,
                            money: money,
                            width: 115,
                            hegiht: 50,
                            bordersize: 2,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: foods.length,
                          padding: EdgeInsets.only(top: 40),
                          itemBuilder: (context, index) {
                            return FoodMarketItem(foods[index]);
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
