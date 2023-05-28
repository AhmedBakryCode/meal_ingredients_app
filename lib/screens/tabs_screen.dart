
import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import "package:meal_app/screens/category_screen'.dart";
import 'package:meal_app/screens/favourite_screen.dart';

import 'main_drawer.dart';
class TabsScreen extends StatefulWidget {
  final   List<Meal>favouriemeal;

  TabsScreen( this.favouriemeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String,Widget>> pages;
  final List<Map<String,Object>> _title=[
    {
      'title':"Categories",
    },
    {
      'title':"Favourite",
    },
  ];
  int _selectpageIndex=0;
  @override
  void initState(){
    pages=[
      {
        'page':categoryScreen(),
      },
      {
        'page':favouriteScreen(widget.favouriemeal),
      },
    ];
    super.initState();
  }
  void selectPage(int value) {
    setState((){
      _selectpageIndex=value;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(_title[_selectpageIndex]["title"].toString()),
    ),
     body:pages[_selectpageIndex]['page'],

      bottomNavigationBar:BottomNavigationBar(selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: selectPage,
        currentIndex: _selectpageIndex,
        backgroundColor:Colors.red ,
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favourite',
          ),

        ],

      ) ,
      drawer: MainDrawer(),
    );
  }


}
