import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/main2.dart';
import 'package:meal_app/modules/meal.dart';
import 'package:meal_app/screens/categories_mealscreen.dart';
import "package:meal_app/screens/category_screen'.dart";
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    "vegeterian": false,
  };
  List<Meal> favouritemeal = [];

  bool isfavourite(String id) {
    return favouritemeal.any((meal) => meal == id);
  }

  void togglefavourite(String mealId) {
    final existingIndex = favouritemeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouritemeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouritemeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  List<Meal> _avialablemeal = DUMMY_MEALS;

  void _setfilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      _avialablemeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        ;
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        ;
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        ;
        if (_filters['vegeterian']! && !meal.isVegetarian) {
          return false;
        }
        ;
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        accentColor: Colors.teal,
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.black54),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(favouritemeal),
        mealScreen.routeName: (context) => mealScreen(_avialablemeal),
        MealDetail.RouteName: (ctx) => MealDetail(togglefavourite, isfavourite),
        FilterScreen.routename: (ctx) => FilterScreen(_setfilters, _filters)
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      //  home: main2(),
    );
  }
}
