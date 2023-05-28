

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';
class categoryScreen extends StatelessWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,

        ),
        children: DUMMY_CATEGORIES.map((e) =>
categoryitem(title: e.title,id: e.id,color: e.color,)
        ).toList(),
      padding: EdgeInsets.all(25),),
    );
  }
}
