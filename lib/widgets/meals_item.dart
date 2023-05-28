import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class mealItem extends StatelessWidget {
  final String id;

  final String imageuri;
  final String title;
  final int Duration;
  final Complexity complexity;
  final Affordability affordability;
  const mealItem({required this.imageuri,
      required this.title,
      required this.Duration,
      required this.complexity,
      required this.affordability,
      required this.id});
  String get complexityText{
    switch(complexity){
      case Complexity.Simple :return "simple";break;
      case Complexity.Challenging :return "Challenging"; break;
      case Complexity.Hard:return "Hard"; break;
      default :return "Unknown";
    }
  }
  String get AffortabilityText{
    switch(affordability){
      case Affordability.Affordable :return "Affordable";break;
      case Affordability.Luxurious :return "Luxurious"; break;
      case Affordability.Pricey:return "Pricey"; break;
      default :return "Unknown";
    }
  }

  void selectMeal(BuildContext ctx){
     Navigator.of(ctx).pushNamed(MealDetail.RouteName,arguments:id );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageuri),
                ),
                Positioned(bottom: 15,right: 10,child: Container(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),color: Colors.blueGrey,width: 200,child: Text(title,style: TextStyle(fontSize: 25,color: Colors.white),softWrap: true,overflow: TextOverflow.fade,))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 8,),
                    Text("$Duration min"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work_outline),
                    SizedBox(width: 8,),
                    Text("$complexityText"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 8,),
                    Text("$AffortabilityText"),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

}
