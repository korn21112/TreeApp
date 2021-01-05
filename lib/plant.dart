import 'package:flutter/material.dart';

class Plant {
  String name,water,image;
  double height;
  int age;

  Plant({
    this.name = 'Basil Plant',
    this.height = 43,
    this.water = 'Medium',
    this.age = 24,
    this.image = 'assets/ice.png'
  });
}

List<Plant> plants = [
  Plant(
    name: 'ICE',
    height: 10,
    water: 'Medium',
    age: 1,
    image: 'assets/ice.png'
  ),
  Plant(
      name: 'TIGER',
      height: 100,
      water: 'LOW',
      age: 1,
      image: 'assets/tiger.png'
  ),
  Plant(
      name: 'SNAKE',
      height: 1000,
      water: 'HIGH',
      age: 1,
      image: 'assets/snake.png'
  )
];