import 'package:flutter/material.dart';

import '../screens/categories_mealscreen.dart';

class categoryitem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const categoryitem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(mealScreen.routeName, arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [color.withOpacity(0.6), color])),
      ),
    );
  }
}
