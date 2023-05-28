import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'main_drawer.dart';
class FilterScreen extends StatefulWidget {
static const routename="/filter";
final Function savefilters;
final Map <String,bool>Currentfilter;
   FilterScreen(this.savefilters, this.Currentfilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
   bool _isGlutenFree=false;
   bool _isLactoseFree=false;
   bool _isVegan=false;
   bool _isVegetarian=false;
   @override
   void initState() {
      _isGlutenFree=widget.Currentfilter['gluten']!;
     _isLactoseFree=widget.Currentfilter['lactose']!;
     _isVegan=widget.Currentfilter['vegan']!;
     _isVegetarian=widget.Currentfilter['vegeterian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: [
          IconButton(icon: Icon(Icons.save_alt), onPressed:(){
            final selectFilters={
              'gluten':_isGlutenFree,
              'lactose':_isLactoseFree,
              'vegan':_isVegan,
              "vegeterian":_isVegetarian,

            };
            widget.savefilters(selectFilters);
          })
      ],
      ),
      body: Container(width: double.infinity,
        child: Column(
          children: [
            SwitchListTile(
            title:Text("Gluten-free"), onChanged:(newval){
               setState((){
                 _isGlutenFree=newval;
               });
          }, value: _isGlutenFree ,subtitle: Text("Only include gluten free meal"),
          ),
            SwitchListTile(
              title:Text("lactose-free"), onChanged:(newval){
              setState((){
                _isLactoseFree=newval;
              });
            }, value: _isLactoseFree ,subtitle: Text("Only include Lactose free meal"),
            ),
            SwitchListTile(
              title:Text("Vegan "), onChanged:(newval){
              setState((){
                _isVegan=newval;
              });
            }, value: _isVegan ,subtitle: Text("Only include Vegan free meal"),
            ),
            SwitchListTile(
              title:Text("Vegetarian"), onChanged:(newval){
              setState((){
                _isVegetarian=newval;
              });
            }, value: _isVegetarian ,subtitle: Text("Only include Vegetarian free meal"),
            ),

          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
