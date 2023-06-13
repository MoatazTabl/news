import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/language_model.dart';
import 'package:news/provider/provider.dart';
import 'package:news/screens/widgets/language_selection.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var language = LanguageModel.getLanguages();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Language",
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color(0xff39A552),
                fontWeight: FontWeight.w500),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              bottomSheetModal();
              setState(() {});
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0),
              fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width * .85, 40)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff39A552)))),
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    provider.language,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xff39A552),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.expand_more,
                  color: Color(0xff39A552),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  bottomSheetModal() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return LanguageSelection(
                      language[index].language, language[index].country_code);
                },
                itemCount: language.length,
              ),
            ),
          ],
        );
      },
    ).whenComplete(() {
      setState(() {});
    });
  }
}
