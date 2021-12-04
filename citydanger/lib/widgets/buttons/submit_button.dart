import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusyButton extends StatefulWidget {
  final void Function()? onTap;
  final String text;
  final bool? busy;
  final double? width;

  BusyButton(
      {required this.text,
      required this.onTap,
      required this.busy,
      this.width});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: InkWell(
        child: AnimatedContainer(
          height: 45,
          width: widget.width ?? 275,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: widget.busy! ? 10 : 15,
              vertical: widget.busy! ? 5 : 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).canvasColor,
                Theme.of(context).canvasColor,
              ],
            ),
          ),
          margin: const EdgeInsets.only(
            top: 25,
            bottom: 15,
          ),
          child: !widget.busy!
              ? Text(
                  widget.text,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: -0.5,
                  ),
                )
              : const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
        ),
      ),
    );
  }
}
