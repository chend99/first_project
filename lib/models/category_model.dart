import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
          name: 'Cake',
          iconPath: 'assets/icons/cake.svg',
          boxColor: Colors.redAccent),
    );

    categories.add(
      CategoryModel(
          name: 'Asian',
          iconPath: 'assets/icons/bowl.svg',
          boxColor: Colors.greenAccent),
    );

    categories.add(
      CategoryModel(
          name: 'Pizza',
          iconPath: 'assets/icons/pizza.svg',
          boxColor: Colors.blueAccent),
    );

    categories.add(
      CategoryModel(
          name: 'Burger',
          iconPath: 'assets/icons/burger.svg',
          boxColor: Colors.lightBlueAccent),
    );
    return categories;
  }
}
