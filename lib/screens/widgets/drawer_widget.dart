import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  Function onDrawerSelect;
  DrawerWidget(this.onDrawerSelect);

  static int category=1;
  static int settings=2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      color: Colors.white,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 60,
            width: double.infinity,
            color: const Color(0XFF39A552),
            child: Center(
              child: Text(
                "News App!",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
           InkWell(
             onTap: (){
               onDrawerSelect(category);
             },
             child: Text("Categories",
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),
           ),
           InkWell(
             onTap: (){
               onDrawerSelect(settings);

             },
             child: Text("Settings",
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),
           ),
        ],
      ),
    );
  }
}
