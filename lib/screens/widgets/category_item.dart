import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem(this.categoryModel,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: categoryModel.color,

          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: index.isOdd? Radius.circular(20):Radius.zero,
            bottomLeft: index.isEven? Radius.circular(20):Radius.zero,
          )),
      child: Column(
        children: [
          Image.asset(categoryModel.image,height: 120,),
          Center(child: Text(categoryModel.name,style: GoogleFonts.poppins(fontSize: 18),)),
        ],
      ),
    );
  }
}
