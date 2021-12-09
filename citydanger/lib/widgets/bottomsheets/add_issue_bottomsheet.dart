/*=============== Owned packages ===================*/
import 'package:citydanger/enums/snackbar_type.dart';
import 'package:citydanger/locator.dart';
import 'package:citydanger/view_models/issue_view_model.dart';
import 'package:citydanger/widgets/buttons/submit_button.dart';
import 'package:citydanger/widgets/description_textfield.dart';
import 'package:citydanger/widgets/image_container.dart';
/*=============== Extern packages ==================*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BottomSheetIssue extends StatelessWidget {
  double? lat;
  double? longi;
  BottomSheetIssue({@required this.lat,@required this.longi});
  @override
  Widget build(BuildContext context) {
    String descriptionController = '';
    File? issueImage;

    return ViewModelBuilder<IssueViewModel>.reactive(
      viewModelBuilder: () => locator<IssueViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) => Container(
        height: 600,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Add Issue",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              ImageContainer(
                image: issueImage,
                onTap: () async {
                  issueImage = await model.pickCertificaitonPhoto();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DescriptionTextField(
                initialValue: '',
                validator: null,
                onChanged: (value) => descriptionController = value,
                color: Colors.grey[200],
              ),
              const SizedBox(
                height: 30,
              ),
              BusyButton(
                text: "Submit Issue",
                onTap: () async {
                  if (model.isBusy == false &&
                      issueImage != null &&
                      descriptionController != '') {
                    await model.uploadIssue(
                        descriptionController, issueImage, lat, longi);
                    model.navigationService.popRepeated(1);
                  } else {
                    model.snackBarService.showCustomSnackBar(
                        variant: SnackBarType.Error,
                        duration: const Duration(seconds: 3),
                        title: "Warrning",
                        message:
                            "You should add at least a title and an image");
                  }
                },
                busy: model.isBusy,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
