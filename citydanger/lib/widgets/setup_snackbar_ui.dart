/*=============== Owned packages ===================*/
import 'package:citydanger/enums/snackbar_type.dart';
import 'package:citydanger/locator.dart';
/*=============== Extern packages ==================*/
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.Error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      dismissDirection: DismissDirection.horizontal,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.Success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
