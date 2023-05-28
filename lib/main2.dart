import 'package:flutter/material.dart';
import "./screens/category_screen'.dart";



class main2 extends StatefulWidget {
  const main2({Key? key}) : super(key: key);

  @override
  State<main2> createState() => _main2State();
}

class _main2State extends State<main2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal "),

      )
      ,body:categoryScreen(),);

  }
}
