/*=============== Owned packages ===================*/

/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class ImageContainer extends StatelessWidget {
  final File? image;
  final void Function()? onTap;

  ImageContainer({
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: InkWell(
        child: Container(
          height: 180,
          width: size.width - 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: image == null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.camera_enhance, size: 50),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        'Add an image',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Theme.of(context)
                              .backgroundColor
                              .withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                )
              : Image(
                  fit: BoxFit.contain,
                  image: FileImage(image!),
                ),
        ),
        onTap: onTap,
      ),
    );
  }
}
