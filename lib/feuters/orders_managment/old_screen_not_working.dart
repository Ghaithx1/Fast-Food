// import 'package:fast_food/core/helpers/spcaing.dart';
// import 'package:fast_food/core/routing/routes.dart';
// import 'package:fast_food/core/theming/color_manager.dart';
// import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
// import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
// import 'package:fast_food/feuters/orders_managment/logic/orders/orders_cubit.dart';
// import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_cubit.dart';
// import 'package:fast_food/feuters/orders_managment/logic/orders_manegment/orders_manegment_state.dart';
// import 'package:fast_food/feuters/orders_managment/logic/orders/orders_state.dart';
// import 'package:fast_food/feuters/orders_managment/logic/users/users_cubit.dart';
// import 'package:fast_food/feuters/orders_managment/logic/users/users_state.dart';
// import 'package:fast_food/feuters/orders_managment/widgets/food_dialog/food_list_dialog.dart';
// import 'package:fast_food/feuters/orders_managment/widgets/food_table/food_table.dart';
// import 'package:fast_food/feuters/orders_managment/widgets/image_button_collection.dart';
// import 'package:fast_food/feuters/orders_managment/widgets/name_text.dart';
// import 'package:fast_food/feuters/orders_managment/widgets/next_button.dart';
// import 'package:fast_food/feuters/orders_managment/widgets/user_dialog/user_list_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// //! Dont use this state it's not working


// class _manageOrdersScreen extends StatefulWidget {
//   _manageOrdersScreen({super.key});

//   @override
//   State<_manageOrdersScreen> createState() => _manageOrdersScreenState();
// }

// class _manageOrdersScreenState extends State<_manageOrdersScreen> {
//   String name = 'ahmed';

//   double money = 32;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrdersManegmentCubit, OrdersManegmentState>(
//         builder: (context, state) {
//       return state.when(
//         initial: () {
//           return Scaffold(
//             body: Container(
//               child: (ElevatedButton(
//                 child: Text('change'),
//                 onPressed: () {
//                   BlocProvider.of<OrdersManegmentCubit>(context).NextPerson();
//                 },
//               )),
//             ),
//           );
//         },
//         Loading: () {
//           return CircularProgressIndicator();
//         },
//         Loaded: (user, foods, money) {
//           return BlocListener<OrdersCubit, OrdersState>(
//             listener: (context, state) {
//               state.when(
//                   getFoodsList: (foodList, type) {
//                     print(foodList);
//                     showDialog(
//                         context: context,
//                         builder: (_) {
//                           return foodListDialog(
//                             foodList,
//                             addFood: (foodPrice, foodName) {
//                               BlocProvider.of<OrdersManegmentCubit>(context)
//                                   .addFood(Food(
//                                       name: foodName,
//                                       price: foodPrice,
//                                       foodType: type));
//                               Navigator.of(context).pop();
//                               BlocProvider.of<OrdersCubit>(context).fetchData();
//                             },
//                             choseFood: (food) {
//                               BlocProvider.of<OrdersManegmentCubit>(context)
//                                   .addFoodForUser(user, food);
//                               Navigator.of(context).pop();
//                             },
//                           );
//                         });
//                   },
//                   initial: () => {},
//                   addressLoadSuccess: () {});
//             },
//             child: BlocListener<UsersCubit, UsersState>(
//               listener: (context, state) {
//                 state.when(
//                     initial: () {},
//                     getAllUsers: (Userslist) {
//                       showDialog(
//                           context: context,
//                           builder: (_) => userListDialog(
//                                 Userslist,
//                                 addUser: (user) {
//                                   BlocProvider.of<OrdersManegmentCubit>(context)
//                                       .addUser(User(name: user, money: 0.0, taken: false));
//                                   Navigator.of(context).pop();
//                                   BlocProvider.of<UsersCubit>(context)
//                                       .fetchData();
//                                   BlocProvider.of<OrdersManegmentCubit>(context)
//                                       .fetchUsersWithoutAction();
//                                 },
//                                 choseUser: (user) {},
//                               ));
//                     });
//               },
//               child: Scaffold(
//                 appBar: AppBar(
//                   title: Text(
//                     'Fast Food',
//                     style: TextStyle(
//                         fontSize: 30,
//                         color: colorManager.mainorange,
//                         fontStyle: FontStyle.italic),
//                   ),
//                 ),
//                 drawer: Drawer(
//                   child: ListView(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context)
//                               .pushNamed(Routes.orders_with_name);
//                         },
//                         child: Text(
//                           'Orders & Names',
//                           style: TextStyle(color: colorManager.mainorange),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context)
//                               .pushNamed(Routes.orders_with_market);
//                         },
//                         child: Text(
//                           'Market',
//                           style: TextStyle(color: colorManager.mainorange),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 resizeToAvoidBottomInset: false,
//                 body: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 21.h, vertical: 10.w),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               nameText(
//                                 text: user.name,
//                                 IsItHaveMethod: true,
//                                 ontap: () {
//                              //     BlocProvider.of<UsersCubit>(context)
//                                  //     .LoadThecubit();
//                                   BlocProvider.of<UsersCubit>(context)
//                                       .getTheUsers();
//                                 },
//                               ),
//                               Expanded(child: Container()),
//                               nameText(
//                                 bordercolor: colorManager.green,
//                                 money: money,
//                                 bordersize: 2.0,
//                                 hegiht: 70,
//                                 width: 100,
//                                 IsItHaveMethod: false,
//                               ),
//                             ],
//                           ),
//                           verticalspace(48),
//                           imageButtonCollection(
//                             (value) {
//                               BlocProvider.of<OrdersCubit>(context)
//                                   .LoadThecubit();
//                               BlocProvider.of<OrdersCubit>(context)
//                                   .getTheListOfType(value);
//                             },
//                           ),
//                           verticalspace(20),
//                         ],
//                       ),
//                     ),
//                     nextButton(text: "Next",fontSize: 32, () {
//                       BlocProvider.of<OrdersManegmentCubit>(context)
//                           .NextPerson();
//                     }),
//                     FoodTable(foods),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         Erorr: (errorMessage) {
//           return Text('$errorMessage');
//         },
//         Empty: () {
//           return Text('empty');
//         },
//       );
//     });
//   }
// }
