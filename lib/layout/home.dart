import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/categories.dart';
import 'package:news/screens/news_screen.dart';
import 'package:news/screens/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool secondary = false;
  bool main = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Visibility(
          visible: main,
          child: DrawerWidget(onDrawerClick),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: main,
          elevation: 0,
          flexibleSpace: Visibility(
            replacement: IconButton(
              onPressed: () {
                secondary = !secondary;
                main = !main;

                setState(() {});
              },
              icon: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Visibility(
                    visible: main,
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            visible: secondary,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 320,
                child: TextField(
                  enabled: secondary,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        secondary = !secondary;
                        main = !main;

                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Color(0xFF39A552),
                      ),
                    ),
                    suffixIcon:  IconButton(
                      onPressed:(){

                      },
                      icon: const Icon(Icons.search,
                        color: Color(0xFF39A552),),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: "Search Article",
                    hintStyle: const TextStyle(
                      color: Color(0x6639A552),
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Visibility(
            visible: main,
            child:
                Text(categoryModel == null ? "News App" : categoryModel!.name),
          ),
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
            categoryModel == null
                ? CategoriesScreen(onCategorySelected)
                : NewsScreen(categoryModel!),
          ],
        ),
      ),
    );
  }

  CategoryModel? categoryModel = null;

  onCategorySelected(category) {
    categoryModel = category;
    setState(() {});
  }

  onDrawerClick(int num) {
    if (num == DrawerWidget.category) {
      categoryModel = null;
    } else if (num == DrawerWidget.settings) {}
    setState(() {
      Navigator.pop(context);
    });
  }
}
