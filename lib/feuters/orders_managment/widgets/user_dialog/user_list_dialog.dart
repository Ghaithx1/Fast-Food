import 'dart:ffi';

import 'package:fast_food/core/helpers/functoins.dart';
import 'package:fast_food/feuters/orders_managment/data/model/food.dart';
import 'package:fast_food/feuters/orders_managment/data/model/user.dart';
import 'package:fast_food/feuters/orders_managment/widgets/food_dialog/food_list_dialog_item.dart';
import 'package:fast_food/feuters/orders_managment/widgets/buttons/next_button.dart';
import 'package:fast_food/feuters/orders_managment/widgets/user_dialog/user_list_dialog_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class userListDialog extends StatelessWidget {
  userListDialog(this.users,{required this.showAllUsers,required this.addUser,required this.choseUser,super.key});
  List<User> users;
  TextEditingController UserName = TextEditingController() ;
  VoidCallback showAllUsers;
  ValueSetter<User> choseUser;
  ValueSetter<String> addUser;
  
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
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return UserListDialogItem(users[index],onPressed: (user) => choseUser(user),);
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
                  Expanded(child: TextFormField(decoration: InputDecoration(hintText: "User Name"),controller: UserName,)),
                  SizedBox(width: 20,), 
                  nextButton(text: "Add", () {addUser(UserName.text);},fontSize: 25,),
                  SizedBox(width: 10,), 
                  nextButton(text: "Show All", () {showAllUsers();},fontSize: 25),
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
