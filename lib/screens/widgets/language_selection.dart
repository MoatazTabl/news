import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/provider/provider.dart';
import 'package:provider/provider.dart';


class LanguageSelection extends StatelessWidget {
  LanguageSelection(this.language,this.languageCode);

  String language;
  String languageCode;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return InkWell(
      onTap: (){
        provider.language=language;
        provider.languageCode=languageCode;

        Navigator.pop(context);


      },

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(language,style: GoogleFonts.poppins(
            fontSize: 21,
            color: const Color(0xff39A552),
            fontWeight: FontWeight.w500),),
      ),
    );
  }
}
