/*=============== Owned packages ===================*/
import 'package:citydanger/locator.dart';
/*=============== Extern packages ==================*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class IssueContainer extends StatelessWidget {
  final SnackbarService snackbarService = locator<SnackbarService>();
  final int index;
  final String description;
  final String issueUrl;
  final int certificationLen;
  final Function showDialog;

  IssueContainer(
    this.index,
    this.description,
    this.issueUrl,
    this.certificationLen,
    this.showDialog,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(),
      child: Container(
        width: 330,
        height: 90,
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsetsDirectional.only(start: 15),
              child: CachedNetworkImage(
                imageUrl: issueUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 260,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  description != ''
                      ? Container(
                          padding: const EdgeInsets.only(right: 20),
                          height: 70,
                          alignment: AlignmentGeometry.lerp(
                              Alignment.centerLeft, Alignment.center, 0),
                          child: Text(
                            description,
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),
                        )
                      : const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
