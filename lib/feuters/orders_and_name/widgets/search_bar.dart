import 'package:fast_food/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildSearchBar extends StatelessWidget {
  TextEditingController _searchTextController;
  ValueSetter<String> onChanged;
  BuildSearchBar(this._searchTextController,{required this.onChanged,super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
      width: 220,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(width: 2,color: colorManager.morelightorange)
      ),
       child: TextField
        (controller: _searchTextController,
         cursorColor: colorManager.mainorange,
         decoration: InputDecoration(
          suffixIcon: Icon(Icons.search,color: colorManager.morelightorange,),
          hintText: 'Find the food',
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 18),
         ),
         style: TextStyle(fontSize: 18),
         onChanged: (searchedCharacter){
          onChanged(searchedCharacter);
         },
        ),
     
   );
  }
}