/*=============== Owned packages ===================*/

/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionTextField extends StatelessWidget {
  final String initialValue;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color? color;

  DescriptionTextField(
      {required this.initialValue,
      required this.validator,
      required this.onChanged,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.only(
        left: 15,
        top: 15,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        maxLength: 80,
        maxLines: 5,
        initialValue: initialValue.isEmpty ? null : initialValue,
        keyboardType: TextInputType.multiline,
        style: GoogleFonts.montserrat(
          color: Theme.of(context).backgroundColor.withOpacity(0.6),
        ),
        decoration: InputDecoration.collapsed(
          hintText: 'Description',
          hintStyle: GoogleFonts.montserrat(
            color:Colors.black,
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
