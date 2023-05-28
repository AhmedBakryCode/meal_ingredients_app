import 'dart:ui';

import 'package:flutter/material.dart';
import 'filter_screen.dart';
class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(width: double.infinity,height: 120,
            padding: EdgeInsets.all(20),color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up!",style: TextStyle(fontSize: 30,fontWeight:FontWeight.w900 ,
              color: Colors.white,
              backgroundColor: Colors.blue,
            ),),
          ),
          ListTile(onTap: (){
            Navigator.of(context).pushReplacementNamed('/');
          },leading:Icon(Icons.food_bank_rounded,color: Colors.black,),title: Text("Meal",style: TextStyle(fontWeight: FontWeight.bold ),),

          ),
      ListTile(onTap: (){
        Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
      },leading:Icon(Icons.settings,color: Colors.black,),title: Text("Filters",style: TextStyle(fontWeight: FontWeight.bold ),),
      ),
        ],
      ),
    );
  }
}
