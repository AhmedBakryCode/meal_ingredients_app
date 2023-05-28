
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetail extends StatelessWidget {
static const RouteName='meal_detail';
final Function togglefavourite;
final Function isfavourite;

   MealDetail(this.togglefavourite,this.isfavourite);

  @override
  Widget build(BuildContext context) {
    final mealid=ModalRoute.of(context)!.settings.arguments as String;
final    selectedmeal= DUMMY_MEALS.firstWhere((meal) =>meal.id==mealid );

    return Scaffold(backgroundColor: Colors.white38,
      appBar: AppBar(
        title: Text(selectedmeal.title,style: TextStyle(color: Colors.black),),
      ),
body: ListView(
  children: [
    Container(
    width: double.infinity,height: 300,child: Image.network(selectedmeal.imageUrl)),
  Container(margin: EdgeInsets.symmetric(vertical: 10),
    child: Text("Ingredients",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,),textAlign: TextAlign.center, ),
  ),
    Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
      height: 200,width: 300,
      child: ListView.builder(itemBuilder:(ctx,index)=>
          Card(
            color: Colors.yellowAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Text(selectedmeal.ingredients[index].toString()),
            ),
          )
        ,itemCount: selectedmeal.ingredients.length,),
    ),
    Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(" Steps",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),

    ),
    Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),height: 200,width: 300,
      child: ListView.builder(itemBuilder:(ctx,index)=>
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.red,
              child: Text("${index+1}",style: TextStyle(color: Colors.black),),
            ),
            title: Text(selectedmeal.steps[index].toString()),
          ),
        itemCount: selectedmeal.steps.length,),
    ),

  ],
),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isfavourite(mealid) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => togglefavourite(mealid),
      ),
    );
  }
}
