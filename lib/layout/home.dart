import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/categories.dart';
import 'package:news/screens/news_screen.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/screens/widgets/drawer_widget.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(onDrawerClick),
        appBar: AppBar(
          elevation: 0,
          title:  Text(categoryModel==null?"News App":categoryModel!.name),
          backgroundColor: const Color(0xFF39A552),
          centerTitle: true,
          shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22))),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/background.png",
              fit: BoxFit.fill,
            ),
            categoryModel==null? CategoriesScreen(onCategorySelected):NewsScreen(categoryModel!),
          ],
        ),
      ),
    );
  }

  CategoryModel? categoryModel=null;

  onCategorySelected(category) {
    categoryModel=category;
    setState(() {

    });
  }

  onDrawerClick(int num)
  {
    if(num==DrawerWidget.category)
      {
          categoryModel=null;
      }
    else if(num==DrawerWidget.settings)
      {

      }
    setState(() {
      Navigator.pop(context);
    });
  }
}
