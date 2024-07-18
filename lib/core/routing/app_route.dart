import 'package:fast_food/core/routing/routes.dart';
import 'package:fast_food/feuters/orders_and_market/logic/cubit/orders_and_market_cubit.dart';
import 'package:fast_food/feuters/orders_and_market/widgets/orders_and_market_screen.dart';
import 'package:fast_food/feuters/orders_and_name/logic/cubit/orders_and_name_cubit.dart';
import 'package:fast_food/feuters/orders_and_name/widgets/orders_and_name_screen.dart';
import 'package:fast_food/feuters/orders_managment/data/repo/orders_managment_rep.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders/orders_cubit.dart';
import 'package:fast_food/feuters/orders_managment/manage_orders_screen_new.dart';
import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_cubit.dart';
import 'package:fast_food/feuters/orders_managment/logic/users/users_cubit.dart';
import 'package:fast_food/feuters/orders_managment/old_screen_not_working.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Add this import

class AppRouting {
  OrdersManagmentRepo ordersManagmentRepo = OrdersManagmentRepo();
  Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.manage_orders_screen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    OrdersManegmentCubit(ordersManagmentRepo)..fetchUsers(),
              ),
              BlocProvider(
                create: (context) => OrdersCubit()..fetchData(),
              ),
              BlocProvider(
                create: (context) => UsersCubit(),
              )
            ],
            child:  ManageOrdersScreenNew(),
          ),
        );
      case Routes.orders_with_name:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => OrdersAndNameCubit(),
                  child: OrdersAndNameScreen(),
                ));
      case Routes.orders_with_market:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => OrdersAndMarketCubit(),
              child: OrdersAndMarketScreen(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Container(
            child: Text('The page ${settings.name} is not found'),
          ),
        );
    }
  }
}
