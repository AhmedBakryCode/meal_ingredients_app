
import 'package:flutter/material.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/widgets/meals_item.dart';
class favouriteScreen extends StatelessWidget {
final   List<Meal>favouritemeal;

   favouriteScreen(this.favouritemeal);

@override
  Widget build(BuildContext context) {
  if (favouritemeal.isEmpty) {
    return Center(
      child: Text("there is no element favourite"),
    );
  }

  else{
  return ListView.builder(itemBuilder:(ctx,index){
  final String image=favouritemeal[index].imageUrl;

  return mealItem(
  imageuri: image,
  affordability: favouritemeal[index].affordability,
  Duration: favouritemeal[index].duration,
  complexity: favouritemeal[index].complexity,
  title: favouritemeal[index].title, id:favouritemeal[index].id ,
  );
  },
  itemCount:favouritemeal.length ,);
  }

}
}
