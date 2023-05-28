

import 'package:meal_app/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/widgets//meals_item.dart';
class mealScreen extends StatefulWidget {
static const routeName="category_meal";
final List<Meal> availableMals;

   mealScreen( this.availableMals) ;
  @override
  State<mealScreen> createState() => _mealScreenState();
}

class _mealScreenState extends State<mealScreen> {
  @override
  Widget build(BuildContext context) {
    final arg=ModalRoute.of(context)?.settings.arguments as Map<String,String>;
final CatId=arg["id"];
final CatTitle=arg["title"];
final Catmeal=widget.availableMals.where((meal){
return meal.categories.contains(CatId);}
).toList();
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(title: Text("$CatTitle",style: TextStyle(color: Colors.black),))
      ,
      body: ListView.builder(itemBuilder:(ctx,index){
        final String image=Catmeal[index].imageUrl;

        return mealItem(
          imageuri: image,
            affordability: Catmeal[index].affordability,
            Duration: Catmeal[index].duration,
            complexity: Catmeal[index].complexity,
            title: Catmeal[index].title, id:Catmeal[index].id ,
        );
    },
      itemCount:Catmeal.length ,),
    );
  }
}
