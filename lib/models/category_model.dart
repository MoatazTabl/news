import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(this.id, this.name, this.image, this.color);

  static List<CategoryModel>getCategories()
  {
    return  [
      CategoryModel("business", "Business", "assets/bussines.png", const Color(0XFFCF7E48)),
      CategoryModel("entertainment", "Entertainment", "assets/Politics.png", const Color(0XFF003E90)),
      CategoryModel("general", "General", "assets/general.png", const Color(0XFFCF7E48)),
      CategoryModel("health", "Health", "assets/health.png", const Color(0XFFED1E79)),
      CategoryModel("science", "Science", "assets/science.png", const Color(0XFFF2D352)),
      CategoryModel("sports", "Sports", "assets/sports.png", const Color(0XFFC91C22)),
      CategoryModel("technology", "Technology", "assets/bussines.png", const Color(0XFF4882CF)),
    ];
  }
}