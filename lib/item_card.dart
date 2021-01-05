import 'package:flutter/material.dart';
import 'package:test_tree/plant.dart';

class ItemCard extends StatelessWidget{
  final Plant plant ;
  final Function press;

  ItemCard({
    Key key,
    this.plant,
    this.press
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,//_onPress,
      child: Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image:
              AssetImage(plant.image),
              fit: BoxFit.fill),
        ),
        //child: Text('hello'),
      ),
    );
  }

}