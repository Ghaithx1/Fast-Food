import 'package:fast_food/core/routing/routes.dart';
import 'package:fast_food/core/theming/color_manager.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerElements extends StatelessWidget {
  const DrawerElements({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.orders_with_name);
                        },
                        child: Text(
                          'Orders & Names',
                          style: TextStyle(color: colorManager.mainorange),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.orders_with_market);
                        },
                        child: Text(
                          'Market',
                          style: TextStyle(color: colorManager.mainorange),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(context: context, builder: (contex) {
                            return AlertDialog(
                              actions: [
                                Text('Do you want to remove all'),
                                ElevatedButton(onPressed: (){BlocProvider.of<OrdersManegmentCubit>(context).DeleteTheFoodsAndRefactorTheUsers();}, child:Text('Yes'))
                              ],
                            );
                          },);
                          
                        },
                        child: Text(
                          'Remove All',
                          style: TextStyle(color: colorManager.mainorange),
                        ),
                      )
                    ],
                  );
  }
}