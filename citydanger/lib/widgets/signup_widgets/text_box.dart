/*=============== Owned packages ===================*/

/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBoxCustom extends StatelessWidget {
  String textController = "";
  TextBoxCustom({required this.textController});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        maxLength: 100,
        maxLines: 1,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 15,
          ),
          hintStyle: GoogleFonts.montserrat(
            fontSize: 15.5,
            color: Colors.grey[500],
          ),
        ),
        onChanged: (value) => textController = value,
      ),
    );
  }
}
